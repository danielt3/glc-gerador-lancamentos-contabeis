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
    dsPlanoContas: TDatasource;
    dsVinculadores: TDatasource;
    dsLayouts: TDatasource;
    qConsulta: TZQuery;
    qPlanoContas: TZQuery;
    qExecutar: TZQuery;
    qVinculadores: TZQuery;
    qPlanoContaschave1: TLongintField;
    qPlanoContasclassificacao1: TStringField;
    qPlanoContascodigo1: TStringField;
    qPlanoContasdescricao1: TStringField;
    qPlanoContassintetica1: TStringField;
    qLayouts: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qPlanoContasclassificacao1GetText(Sender: TField;
      var aText: string; DisplayText: Boolean);
  private
    fGarbageCollector: TGarbageCollector;

    fNomesConsultas: TStringList;
    fQueriesConsultas: TList;
    fSourceConsultas: TList;

    fMascaraPlanoContas: String;

    function Conectar: Boolean;

    procedure CriarTabelaContas;
    procedure CriarTabelaVinculadores;
    procedure CriarTabelaVinculadoresLayouts;
    procedure CriarTabelaLayouts;
    procedure CriarTabelaLayoutsCampos;
    procedure CriarListaDadosCampo;
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

    procedure GravarListaCampos(pTabela: TZQuery; pNomeArquivo: String);

    property MascaraPlanoContas: String read fMascaraPlanoContas write fMascaraPlanoContas;
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

  try
    fGarbageCollector.Add(fQueriesConsultas);
    fGarbageCollector.Add(fSourceConsultas);
    fGarbageCollector.Add(fNomesConsultas);

    lConf := TStringList.Create;
    lConf.Add('RootDirectory = ' + ExtractFileDir(ApplicationName));
    lConf.SaveToFile(ExtractFileDir(ApplicationName) + 'firebird.conf');
    FreeAndNil(lConf);

    AtualizarBaseDeDados
  except on e:exception do
    MensagemErro(e.Message, 'DataModuleCreate');
  end;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(fGarbageCollector);
end;

procedure TDataModule1.qPlanoContasclassificacao1GetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  aText := MascararTexto(qPlanoContas.FieldByName('classificacao').AsString, MascaraPlanoContas);
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

procedure TDataModule1.CriarTabelaVinculadores;
begin
  TabelaExiste('VINCULADORES');
  CampoExiste('VINCULADORES', 'EMPRESA', 'INT NOT NULL');
  CampoExiste('VINCULADORES', 'CODIGO', 'VARCHAR(10) NOT NULL');
  //CampoExiste('VINCULADORES', 'DATA', 'DATE');
  CampoExiste('VINCULADORES', 'DESCRICAO', 'VARCHAR(40) NOT NULL');
  CampoExiste('VINCULADORES', 'DEBITAR', 'INT NOT NULL');
  CampoExiste('VINCULADORES', 'CREDITAR', 'INT NOT NULL');
  CampoExiste('VINCULADORES', 'HISTORICO', 'VARCHAR(100) NOT NULL');
end;

procedure TDataModule1.CriarTabelaVinculadoresLayouts;
begin
  TabelaExiste('VINCULADORES_LAYOUT');
  CampoExiste('VINCULADORES_LAYOUT', 'VINCULADOR', 'INT NOT NULL');
  CampoExiste('VINCULADORES_LAYOUT', 'LAYOUT', 'INT NOT NULL');
end;

procedure TDataModule1.CriarTabelaLayouts;
begin
  TabelaExiste('LAYOUTS');
  CampoExiste('LAYOUTS', 'EMPRESA', 'INT NOT NULL');
  CampoExiste('LAYOUTS', 'NOME', 'VARCHAR(100) NOT NULL');
end;

procedure TDataModule1.CriarTabelaLayoutsCampos;
begin
  TabelaExiste('LAYOUT_CAMPOS');
  CampoExiste('LAYOUT_CAMPOS', 'LAYOUT', 'INT NOT NULL');
  CampoExiste('LAYOUT_CAMPOS', 'NOME', 'VARCHAR(20) NOT NULL');
end;

procedure TDataModule1.CriarListaDadosCampo;
begin
  TabelaExiste('LAYOUT_CAMPOS_DADOS');
  CampoExiste('LAYOUT_CAMPOS_DADOS', 'LAYOUT', 'INT NOT NULL');
  CampoExiste('LAYOUT_CAMPOS_DADOS', 'CAMPO', 'VARCHAR(20) NOT NULL');
  CampoExiste('LAYOUT_CAMPOS_DADOS', 'DADO', 'VARCHAR(100) NOT NULL');
end;

procedure TDataModule1.AtualizarBaseDeDados;
begin
  CriarTabelaContas;
  CriarTabelaVinculadores;
  CriarTabelaVinculadoresLayouts;
  CriarTabelaLayouts;
  CriarTabelaLayoutsCampos;
  CriarListaDadosCampo;
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
    qExecutar.SQL.SaveToFile(ExtractFilePath(ApplicationName) + 'Executar.sql');
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
    qConsulta.SQL.SaveToFile(ExtractFilePath(ApplicationName) + 'Consultar.sql');
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
    result.SQL.SaveToFile(ExtractFilePath(ApplicationName) + 'NovaConsulta.sql');
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
  result := 0;
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
    lQuery.SQL.SaveToFile(ExtractFilePath(ApplicationName) + 'NovaConsulta.sql');
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

procedure TDataModule1.GravarListaCampos(pTabela: TZQuery; pNomeArquivo: String);
var
  i: Integer;
  lLista: TStringList;
begin
  if pTabela.Active then
  begin
    lLista := TStringList.Create;

    try
      for i := 0 to pTabela.FieldDefs.Count - 1 do
      begin
        lLista.Add(pTabela.FieldDefs.Items[i].Name + ' = ' + pTabela.Fields.Fields[i].AsString);//(pTabela.FieldDefs.Items[i].Name).AsString);
      end;

      lLista.SaveToFile(pNomeArquivo);
    finally
      FreeandNil(lLista);
    end;
  end;
end;

end.

