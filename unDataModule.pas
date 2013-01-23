unit unDataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZConnection, ZDataset, unUtilitario,
  unGarbageCollector, db;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    Conexao: TZConnection;
    Datasource1: TDatasource;
    qConsulta: TZQuery;
    qExecutar: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    fGarbageCollector: TGarbageCollector;

    fNomesConsultas: TStringList;
    fQueriesConsultas: TList;
    fSourceConsultas: TList;

    function Conectar: Boolean;

    procedure CriarTabelaContas;
    procedure AtualizarBaseDeDados;
    procedure TabelaExiste(lNomeTabela: String);
    procedure CampoExiste(lNomeTabela, lNomeCampo, lTipo: String);
  public
    function Executar(SQL: String): Boolean;
    function Consultar(SQL: String): Integer;
    function getQuery(NomeConsulta: String): TZQuery;
    function getDataSource(NomeConsulta: String): TDataSource;
    function NovaConsulta(SQL: String): TZQuery; Overload;
    function NovaConsulta(NomeConsulta: String; SQL: String): Integer;
    function GerarChave(NomeGenerator: String): Integer;
  end; 

var
  DataModule1: TDataModule1; 

implementation

{$R *.lfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  lConf: TStringList;
begin
  fGarbageCollector := TGarbageCollector.Create;

  fQueriesConsultas := TList.Create;
  fSourceConsultas := TList.Create;
  fNomesConsultas := TStringList.Create;

  fGarbageCollector.Add(fQueriesConsultas);
  fGarbageCollector.Add(fSourceConsultas);
  fGarbageCollector.Add(fNomesConsultas);

  lConf := TStringList.Create;
  lConf.Add('RootDirectory = ' + ExtractFileDir(ApplicationName));
  lConf.SaveToFile(ExtractFileDir(ApplicationName) + 'firebird.conf');
  FreeAndNil(lConf);

  CriarTabelaContas;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(fGarbageCollector);
end;

function TDataModule1.Conectar: Boolean;
begin
  result := false;
  Conexao.Connect;
  result := Conexao.Connected;
end;

procedure TDataModule1.CriarTabelaContas;
begin
  TabelaExiste('EMPRESA');
  CampoExiste('EMPRESA', 'CODIGO', 'VARCHAR(7) NOT NULL');
  CampoExiste('EMPRESA', 'NOME', 'VARCHAR(100) NOT NULL');
  CampoExiste('EMPRESA', 'CNPJ', 'VARCHAR(14) NOT NULL');
  CampoExiste('EMPRESA', 'ANOTACOES', 'VARCHAR(1000)');

  TabelaExiste('PLANO_CONTAS');
  CampoExiste('PLANO_CONTAS', 'EMPRESA', 'INT NOT NULL');
  CampoExiste('PLANO_CONTAS', 'EMPRESA_OLD', 'INT');
  CampoExiste('PLANO_CONTAS', 'CODIGO_EXTERNO', 'VARCHAR(10) NOT NULL');
  CampoExiste('PLANO_CONTAS', 'CODIGO', 'VARCHAR(20) NOT NULL');
  CampoExiste('PLANO_CONTAS', 'DESCRICAO', 'VARCHAR(40) NOT NULL');
  CampoExiste('PLANO_CONTAS', 'SINTETICA', 'CHAR(1) DEFAULT ''S'' NOT NULL');
end;

procedure TDataModule1.AtualizarBaseDeDados;
begin
  CriarTabelaContas;
end;

procedure TDataModule1.TabelaExiste(lNomeTabela: String);
var
  lTabelasExistentes: TZQuery;
  lComandoSQL: String;
begin
  lComandoSQL := 'select' + NewLine +
                 '  RDB$RELATION_NAME,' + NewLine +
                 '  RDB$FIELD_NAME' + NewLine +
                 'from' + NewLine +
                 '  RDB$RELATION_FIELDS' + NewLine +
                 'where' + NewLine +
                 '  RDB$RELATION_NAME = ' + QuotedStr(Trim(lNomeTabela));

  lTabelasExistentes := NovaConsulta(lComandoSQL);

  if lTabelasExistentes.IsEmpty then
  begin
    lComandoSQL := 'CREATE TABLE ' + Trim(lNomeTabela) + ' (' + NewLine +
                   '  CHAVE INTEGER NOT NULL)';

    if Executar(lComandoSQL) then
    begin
      lComandoSQL := 'ALTER TABLE ' + Trim(lNomeTabela) + NewLine +
                     'ADD CONSTRAINT PK_' + Trim(lNomeTabela) + NewLine +
                     'PRIMARY KEY (CHAVE)';

      Executar(lComandoSQL);

      lComandoSQL := 'CREATE SEQUENCE GEN_' + Trim(lNomeTabela);
      Executar(lComandoSQL);

      lComandoSQL := 'create trigger ' + Trim(lNomeTabela) + '_BI for ' + Trim(lNomeTabela) + NewLine +
                     'active before insert position 0' + NewLine +
                     'as' + NewLine +
                     'begin' + NewLine +
                     '  if (new.chave is null) then' + NewLine +
                     '    new.chave = gen_id(GEN_' + Trim(lNomeTabela) + ',1);' + NewLine +
                     'end';
      Executar(lComandoSQL);
    end;
  end;
end;

procedure TDataModule1.CampoExiste(lNomeTabela, lNomeCampo, lTipo: String);
var
  lCamposExistentes: TZQuery;
  lComandoSQL: String;
begin
  lComandoSQL := 'select' + NewLine +
                 '  RDB$RELATION_NAME,' + NewLine +
                 '  RDB$FIELD_NAME' + NewLine +
                 'from' + NewLine +
                 '  RDB$RELATION_FIELDS' + NewLine +
                 'where' + NewLine +
                 '  RDB$RELATION_NAME = ' + QuotedStr(Trim(lNomeTabela)) + ' AND' + NewLine +
                 '  RDB$FIELD_NAME = ' + QuotedStr(Trim(lNomeCampo));

  lCamposExistentes := NovaConsulta(lComandoSQL);

  if lCamposExistentes.IsEmpty then
  begin
    lComandoSQL := 'ALTER TABLE' + NewLine +
                   '  ' + Trim(lNomeTabela) + NewLine +
                   'ADD ' + Trim(lNomeCampo) + ' ' + Trim(lTipo);
    Executar(lComandoSQL);
  end;
end;

function TDataModule1.Executar(SQL: String): Boolean;
begin
  result := false;

  try
    qExecutar.Close;
    qExecutar.SQL.Clear;
    qExecutar.SQL.Add(SQL);
    qExecutar.Prepared:= true;
    qExecutar.ExecSQL;

    result := true;
  except
    RaiseLastOSError;
  end;
end;

function TDataModule1.Consultar(SQL: String): Integer;
begin
  result := 0;

  try
    qConsulta.Close;
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add(SQL);
    qConsulta.Open;

    if not qConsulta.IsEmpty then
      result := qConsulta.RecordCount;
  except
    RaiseLastOSError;
  end;
end;

function TDataModule1.getQuery(NomeConsulta: String): TZQuery;
begin
  if (fNomesConsultas.IndexOf(NomeConsulta) > -1) then
    result := TZQuery(fQueriesConsultas.Items[fNomesConsultas.IndexOf(NomeConsulta)])
  else
    result := nil;
end;

function TDataModule1.getDataSource(NomeConsulta: String): TDataSource;
begin
  if (fNomesConsultas.IndexOf(NomeConsulta) > -1) then
    result := TDataSource(fSourceConsultas.Items[fNomesConsultas.IndexOf(NomeConsulta)])
  else
    result := nil;
end;

function TDataModule1.NovaConsulta(SQL: String): TZQuery;
begin
  result := TZQuery.Create(nil);

  try
    fGarbageCollector.Add(result);
    result.Connection := Conexao;

    result.Close;
    result.SQL.Clear;
    result.SQL.Add(SQL);
    result.Open;
  except
    RaiseLastOSError;
  end;
end;

function TDataModule1.NovaConsulta(NomeConsulta: String; SQL: String): Integer;
var
  lQuery: TZQuery;
  lDataSource: TDataSource;
begin
  lQuery := getQuery(NomeConsulta);

  if not Assigned(lQuery) then
  begin
    lQuery := TZQuery.Create(nil);
    lDataSource := TDataSource.Create(nil);
    fGarbageCollector.Add(lQuery);
    fGarbageCollector.Add(lDataSource);
    fQueriesConsultas.Add(lQuery);
    fSourceConsultas.Add(lDataSource);
    fNomesConsultas.Add(NomeConsulta);
    lQuery.Connection := Conexao;
    lDataSource.DataSet := lQuery;
  end;

  try
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(SQL);
    lQuery.Open;

    if not lQuery.IsEmpty then
      result := lQuery.RecordCount;
  except
    RaiseLastOSError;
  end;
end;

function TDataModule1.GerarChave(NomeGenerator: String): Integer;
begin
  result := 0;

  try
    qConsulta.Close;
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('SELECT GEN_ID(' + NomeGenerator + ', 1 ) AS chave FROM RDB$DATABASE');
    qConsulta.Open;

    if not qConsulta.IsEmpty then
      result := qConsulta.FieldByName('chave').AsInteger;
  except
    RaiseLastOSError;
  end;
end;

end.
