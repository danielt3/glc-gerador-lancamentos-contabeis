unit unDataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZConnection, ZDataset, unUtilitario,
  unGarbageCollector, db, CheckLst;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    Conexao: TZConnection;
    Datasource1: TDatasource;
    dsLancamentos: TDatasource;
    dsProcessos: TDatasource;
    dsPlanoContas: TDatasource;
    dsVinculadores: TDatasource;
    dsLayouts: TDatasource;
    qConsulta: TZQuery;
    qLancamentos2: TZQuery;
    qLancamentos: TZQuery;
    qLancamentos2no_vinculador: TStringField;
    qProcessos: TZQuery;
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
    fCamposLancamento: TCamposLancamento;
    fGarbageCollector: TGarbageCollector;

    fNomesConsultas: TStringList;
    fQueriesConsultas: TList;
    fSourceConsultas: TList;

    fMascaraPlanoContas: String;
    fCampoLancamentoAtual: Integer;

    function Conectar: Boolean;

    procedure CriarTabelaContas;
    procedure CriarTabelaVinculadores;
    procedure CriarTabelaVinculadoresLayouts;
    procedure CriarTabelaLayouts;
    procedure CriarTabelaLayoutsCampos;
    procedure CriarListaDadosCampo;
    procedure CriarTabelaLancamentos;
    procedure CriarTabelaSistema;
    procedure CriarTabelaProcessos;
    procedure AtualizarBaseDeDados;
    procedure TabelaExiste(lNomeTabela: String);
    procedure CampoExiste(lNomeTabela, lNomeCampo, lTipo: String; SQLDefault: String = '');
    procedure DeletarCampo(lNomeTabela, lNomeCampo: String);

    procedure MontarCamposLancamento;
    procedure AddCampoLancamento(Nome, Descricao, Tipo, Formato: String; Tamanho: Integer; Obrigatorio: Boolean; TemDados: Boolean = false);

    function  getDataSetType(Nome: String): TFieldType;
  public
    function Executar(SQL: String): Boolean;
    function Consultar(SQL: String): Integer;
    function getQuery(NomeConsulta: String): TZQuery;
    function getDataSource(NomeConsulta: String): TDataSource;
    function NovaConsulta(SQL: String): TZQuery; Overload;
    function NovaConsulta(NomeConsulta: String; SQL: String): Integer;
    function GerarChave(NomeGenerator: String; Testar: Boolean = false): Integer;


    procedure CampoLancamentoFirst;
    procedure CampoLancamentoNext;
    function  CampoLancamentoEof: Boolean;
    function  CampoLancamentoLocate(NomeCampo: String): Integer;
    function  CampoLancamentoLocateDescricao(Descricao: String): Integer;
    function  CampoLancamentoValor(Atributo: String): String;
    function  CampoLancamentoNome: String;
    function  CampoLancamentoType: TFieldType;
    function  CampoLancamentoTipo: String;
    function  CampoLancamentoFormato: String;
    function  CampoLancamentoTamanho: Integer;
    function  CampoLancamentoDados: Boolean; overload;
    function  CampoLancamentoObrigatorio: Boolean; overload;
    function  CampoLancamentoDisPlayFormat: String;
    function  CampoLancamentoDescricao(NomeCampo: String): String; overload;
    function  CampoLancamentoDescricao: String; overload;
    procedure CarregarCamposDisponiveis(var pLista: TCheckListBox);
    procedure CarregarCamposUtilizados(var pLista: TCheckListBox);

    procedure GravarListaCampos(pTabela: TZQuery; pNomeArquivo: String);

    property MascaraPlanoContas: String read fMascaraPlanoContas write fMascaraPlanoContas;
    property CamposLancamento: TCamposLancamento read fCamposLancamento;

    function TipoCampo(pTabela, pCampo: String): String;
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

    MontarCamposLancamento;
    AtualizarBaseDeDados;
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
  //Conexao.Properties.Add('CODEPAGE=UTF8');
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
  //CampoExiste('PLANO_CONTAS', 'EMPRESA', 'INT NOT NULL');
  CampoExiste('PLANO_CONTAS', 'EMPRESA_OLD', 'INT');
  CampoExiste('PLANO_CONTAS', 'CODIGO_EXTERNO', 'VARCHAR(10) NOT NULL');
  CampoExiste('PLANO_CONTAS', 'CODIGO', 'VARCHAR(20) NOT NULL');
  CampoExiste('PLANO_CONTAS', 'DESCRICAO', 'VARCHAR(80) NOT NULL');
  CampoExiste('PLANO_CONTAS', 'SINTETICA', 'CHAR(1) DEFAULT ''S'' NOT NULL');
end;

procedure TDataModule1.CriarTabelaVinculadores;
begin
  TabelaExiste('VINCULADORES');
  //CampoExiste('VINCULADORES', 'EMPRESA', 'INT NOT NULL');
  CampoExiste('VINCULADORES', 'CODIGO', 'VARCHAR(10) NOT NULL');
  //CampoExiste('VINCULADORES', 'DATA', 'DATE');
  DeletarCampo('VINCULADORES', 'DATA');
  CampoExiste('VINCULADORES', 'DESCRICAO', 'VARCHAR(40) NOT NULL');
  CampoExiste('VINCULADORES', 'DEBITAR', 'INT NOT NULL');
  CampoExiste('VINCULADORES', 'CREDITAR', 'INT NOT NULL');
  CampoExiste('VINCULADORES', 'HISTORICO', 'VARCHAR(100)');
end;

procedure TDataModule1.CriarTabelaVinculadoresLayouts;
begin
  TabelaExiste('VINCULADORES_LAYOUT');
  CampoExiste('VINCULADORES_LAYOUT', 'VINCULADOR', 'INT NOT NULL');
  CampoExiste('VINCULADORES_LAYOUT', 'LAYOUT', 'INT NOT NULL');
  //CampoExiste('VINCULADORES_LAYOUT', 'EMPRESA', 'INT', 'SELECT FIRST 1 CHAVE FROM VINCULADORES WHERE VINCULADORES.CHAVE = VINCULADORES_LAYOUT.LAYOUT');
end;

procedure TDataModule1.CriarTabelaLayouts;
begin
  TabelaExiste('LAYOUTS');
  //CampoExiste('LAYOUTS', 'EMPRESA', 'INT NOT NULL');
  CampoExiste('LAYOUTS', 'NOME', 'VARCHAR(100) NOT NULL');
end;

procedure TDataModule1.CriarTabelaLayoutsCampos;
begin
  TabelaExiste('LAYOUT_CAMPOS');
  CampoExiste('LAYOUT_CAMPOS', 'LAYOUT', 'INT NOT NULL');
  CampoExiste('LAYOUT_CAMPOS', 'NOME', 'VARCHAR(20) NOT NULL');
  //CampoExiste('LAYOUT_CAMPOS', 'EMPRESA', 'INT', 'SELECT FIRST 1 CHAVE FROM LAYOUTS WHERE LAYOUTS.CHAVE = LAYOUT_CAMPOS.LAYOUT');
end;

procedure TDataModule1.CriarListaDadosCampo;
begin
  TabelaExiste('LAYOUT_CAMPOS_DADOS');
  CampoExiste('LAYOUT_CAMPOS_DADOS', 'LAYOUT', 'INT NOT NULL');
  CampoExiste('LAYOUT_CAMPOS_DADOS', 'CAMPO', 'VARCHAR(20) NOT NULL');
  CampoExiste('LAYOUT_CAMPOS_DADOS', 'DADO', 'VARCHAR(100) NOT NULL');
  //CampoExiste('LAYOUT_CAMPOS_DADOS', 'EMPRESA', 'INT', 'SELECT FIRST 1 CHAVE FROM LAYOUT_CAMPOS WHERE LAYOUT_CAMPOS.LAYOUT = LAYOUT_CAMPOS_DADOS.LAYOUT AND LAYOUT_CAMPOS.NOME = LAYOUT_CAMPOS_DADOS.CAMPO');
end;

procedure TDataModule1.CriarTabelaLancamentos;
begin
  TabelaExiste('LANCAMENTOS');
  //CampoExiste('LANCAMENTOS', 'EMPRESA', 'INT NOT NULL');
  CampoExiste('LANCAMENTOS', 'LAYOUT', 'INT NOT NULL');
  CampoExiste('LANCAMENTOS', 'DATA_LANC', 'DATE NOT NULL');
  CampoExiste('LANCAMENTOS', 'DATA_EDIT', 'DATE');

  CampoLancamentoFirst;
  while not CampoLancamentoEof do
  begin
    if (CampoLancamentoType = ftString) then
      CampoExiste('LANCAMENTOS', UpperCase(CampoLancamentoNome), 'VARCHAR(200)')
    else if (CampoLancamentoType = ftInteger) then
      CampoExiste('LANCAMENTOS', UpperCase(CampoLancamentoNome), 'INT')
    else if (CampoLancamentoType = ftFloat) then
      CampoExiste('LANCAMENTOS', UpperCase(CampoLancamentoNome), 'DECIMAL(18,6)')
    else if (CampoLancamentoType = ftDateTime) then
      CampoExiste('LANCAMENTOS', UpperCase(CampoLancamentoNome), 'DATE')
    else
      CampoExiste('LANCAMENTOS', UpperCase(CampoLancamentoNome), 'VARCHAR(100)');

    CampoLancamentoNext;
  end;
end;

procedure TDataModule1.CriarTabelaSistema;
begin
  TabelaExiste('SISTEMA');
  CampoExiste('SISTEMA', 'CLIENTE', 'VARCHAR(10) NOT NULL DEFAULT ''''');
  CampoExiste('SISTEMA', 'TEXTO', 'VARCHAR(40) NOT NULL DEFAULT ''A02D1A0S0ASD02SDFGH1F2HK1I56LO497101A''');
end;

procedure TDataModule1.CriarTabelaProcessos;
begin
  TabelaExiste('PROCESSOS');
  CampoExiste('PROCESSOS', 'PAI', 'INT');
  CampoExiste('PROCESSOS', 'FILHO', 'INT');

  TabelaExiste('CONDICOES');
  CampoExiste('CONDICOES', 'PROCESSO', 'INT');
  CampoExiste('CONDICOES', 'CAMPO', 'VARCHAR(20)');
  CampoExiste('CONDICOES', 'CONDICAO', 'VARCHAR(5)');
  CampoExiste('CONDICOES', 'VALOR', 'VARCHAR(200)');
end;

procedure TDataModule1.AtualizarBaseDeDados;
var
  lComandoSQL: String;
begin
  if not FileExists(ExtractFilePath(ApplicationName) + 'DATABASE.FDB') then
    CopyFile(ExtractFilePath(ApplicationName) + 'CLEAR_DATABASE.FDB', ExtractFilePath(ApplicationName) + 'DATABASE.FDB');

  CriarTabelaContas;
  CriarTabelaVinculadores;
  CriarTabelaVinculadoresLayouts;
  CriarTabelaLayouts;
  CriarTabelaLayoutsCampos;
  CriarListaDadosCampo;
  CriarTabelaLancamentos;
  CriarTabelaProcessos;

  lComandoSQL := 'UPDATE layout_campos SET empresa = (SELECT FIRST 1 empresa FROM layouts WHERE layouts.chave = layout_campos.layout)';
  Executar(lComandoSQL);
  lComandoSQL := 'DELETE FROM layout_campos_dados WHERE layout = 0';
  Executar(lComandoSQL);
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
    if (UpperCase(lNomeTabela) = 'EMPRESA') then
      lComandoSQL := 'CREATE TABLE ' + Trim(lNomeTabela) + ' (' + NewLine +
                     '  CHAVE INTEGER NOT NULL)'
    else
      lComandoSQL := 'CREATE TABLE ' + Trim(lNomeTabela) + ' (' + NewLine +
                     '  CHAVE INTEGER NOT NULL,' + NewLine +
                     '  EMPRESA INTEGER NOT NULL)';

    if Executar(lComandoSQL) then
    begin
      if (UpperCase(lNomeTabela) = 'EMPRESA') then
        lComandoSQL := 'ALTER TABLE ' + Trim(lNomeTabela) + NewLine +
                       'ADD CONSTRAINT PK_' + Trim(lNomeTabela) + NewLine +
                       'PRIMARY KEY (CHAVE)'
      else
        lComandoSQL := 'ALTER TABLE ' + Trim(lNomeTabela) + NewLine +
                       'ADD CONSTRAINT PK_' + Trim(lNomeTabela) + NewLine +
                       'PRIMARY KEY (CHAVE, EMPRESA)';

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

procedure TDataModule1.CampoExiste(lNomeTabela, lNomeCampo, lTipo: String;
  SQLDefault: String);
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

    if not Vazio(SQLDefault) then
    begin
      lComandoSQL := 'UPDATE' + NewLine +
                     '  ' + Trim(lNomeTabela) + NewLine +
                     'SET ' + Trim(lNomeCampo) + ' = (' + Trim(SQLDefault) + ')';

      Executar(lComandoSQL);
    end;
  end;
end;

procedure TDataModule1.DeletarCampo(lNomeTabela, lNomeCampo: String);
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

  if not lCamposExistentes.IsEmpty then
  begin
    lComandoSQL := 'ALTER TABLE' + NewLine +
                   '  ' + Trim(lNomeTabela) + NewLine +
                   'DROP ' + Trim(lNomeCampo);
    Executar(lComandoSQL);
  end;
end;

procedure TDataModule1.MontarCamposLancamento;
begin
  AddCampoLancamento('entrada', '*Entrada', 'Decimal', '####.####,##', 8, false, false);
  AddCampoLancamento('saida', '*Saída', 'Decimal', '####.####,##', 8, false, false);
  AddCampoLancamento('data_pag', ' Data de Pagamento', 'Data', 'DD/MM/AAAA', 10, false, false);
  AddCampoLancamento('data_venc', ' Data de Vencimento', 'Data', 'DD/MM/AAAA', 10, false, false);
  AddCampoLancamento('forma_pag', ' Forma de Pagamento', 'Caractere', '', 32, false, false);
  AddCampoLancamento('fornecedor', ' Fornecedor', 'Caractere', '', 32, false, false);
  AddCampoLancamento('numero', ' Número do Doc.', 'Numeral', '##########', 10, false, false);
  AddCampoLancamento('pago_por', '#Tipo de Título', 'Caractere', '', 32, false, true);
  AddCampoLancamento('data', ' Data', 'Data', 'DD/MM/AAAA', 10, true, false);
  AddCampoLancamento('vinculador', ' Vinculador', 'Numeral', '##########', 10, true, false);
  AddCampoLancamento('historico', ' Histórico', 'Caractere', '', 32, false, false);
  AddCampoLancamento('cliente', ' Cliente', 'Caractere', '', 32, false, false);
  AddCampoLancamento('valor', '*Valor', 'Decimal', '####.####,##', 8, false, false);
  //AddCampoLancamento('teste', ' Olá Mundo', 'Caractere', '', 32, false);
end;

procedure TDataModule1.AddCampoLancamento(Nome, Descricao, Tipo, Formato: String;Tamanho: Integer; Obrigatorio: Boolean; TemDados: Boolean);
var
  i: Integer;
begin
  i := Length(fCamposLancamento);
  SetLength(fCamposLancamento, i + 1);

  fCamposLancamento[i].Nome := Nome;
  fCamposLancamento[i].Descricao := Descricao;
  fCamposLancamento[i].Tipo := Tipo;
  fCamposLancamento[i].Formato := Formato;
  fCamposLancamento[i].Tamanho := Tamanho;
  fCamposLancamento[i].TemDados := TemDados;
  fCamposLancamento[i].Obrigatorio := Obrigatorio;
end;

procedure TDataModule1.CampoLancamentoFirst;
begin
  fCampoLancamentoAtual := 0;
end;

procedure TDataModule1.CampoLancamentoNext;
begin
  fCampoLancamentoAtual := fCampoLancamentoAtual + 1
end;

function TDataModule1.CampoLancamentoEof: Boolean;
begin
  result := fCampoLancamentoAtual > Length(fCamposLancamento) -1;
end;

function TDataModule1.CampoLancamentoLocate(NomeCampo: String): Integer;
var
  i: Integer;
begin
  result := -1;

  for i := Low(fCamposLancamento) to High(fCamposLancamento) do
  begin
    if (fCamposLancamento[i].Nome = NomeCampo) then
    begin
      fCampoLancamentoAtual := i;
      result := fCampoLancamentoAtual;
      break;
    end;
  end;
end;

function TDataModule1.CampoLancamentoLocateDescricao(Descricao: String): Integer;
var
  i: Integer;
begin
  result := -1;

  for i := Low(fCamposLancamento) to High(fCamposLancamento) do
  begin
    if (fCamposLancamento[i].Descricao = Descricao) then
    begin
      fCampoLancamentoAtual := i;
      result := fCampoLancamentoAtual;
      break;
    end;
  end;
end;

function TDataModule1.CampoLancamentoValor(Atributo: String): String;
begin
  if not CampoLancamentoEof then
  begin
    if (LowerCase(Atributo) = 'nome') then
      result := fCamposLancamento[fCampoLancamentoAtual].Nome
    else if (LowerCase(Atributo) = 'descricao') then
      result := fCamposLancamento[fCampoLancamentoAtual].Descricao
    else if (LowerCase(Atributo) = 'tipo') then
      result := fCamposLancamento[fCampoLancamentoAtual].Tipo
    else if (LowerCase(Atributo) = 'formato') then
      result := fCamposLancamento[fCampoLancamentoAtual].Formato
    else if (LowerCase(Atributo) = 'tamanho') then
      result := IntToStr(fCamposLancamento[fCampoLancamentoAtual].Tamanho)
    else if (LowerCase(Atributo) = 'obrigatorio') then
      result := iif(fCamposLancamento[fCampoLancamentoAtual].Obrigatorio, 'S', 'N')
    else if (LowerCase(Atributo) = 'temdados') then
      result := iif(fCamposLancamento[fCampoLancamentoAtual].TemDados, 'S', 'N');
  end;
end;

function TDataModule1.CampoLancamentoNome: String;
begin
  result := CampoLancamentoValor('nome');
end;

function TDataModule1.CampoLancamentoType: TFieldType;
begin
  result := getDataSetType(CampoLancamentoValor('tipo'));
end;

function TDataModule1.CampoLancamentoTipo: String;
begin
  result := CampoLancamentoValor('tipo');
end;

function TDataModule1.CampoLancamentoFormato: String;
begin
  result := CampoLancamentoValor('formato');
end;

function TDataModule1.CampoLancamentoTamanho: Integer;
begin
  if (CampoLancamentoValor('tipo') = 'numeral') or (CampoLancamentoValor('tipo') = 'data') then
    result := 0
  else
    result := StrToIntDef(CampoLancamentoValor('tamanho'), 0);
end;

function TDataModule1.CampoLancamentoDados: Boolean;
begin
  result := CampoLancamentoValor('temdados') = 'S';
end;

function TDataModule1.CampoLancamentoObrigatorio: Boolean;
begin
  result := CampoLancamentoValor('obrigatorio') = 'S';
end;

function TDataModule1.CampoLancamentoDisPlayFormat: String;
begin
  if (CampoLancamentoTipo = 'Decimal') then
    result := CampoLancamentoValor('formato')
  else
    result := '';
end;

function TDataModule1.CampoLancamentoDescricao(NomeCampo: String): String;
begin
  if CampoLancamentoLocate(NomeCampo) > -1 then
    Result := fCamposLancamento[fCampoLancamentoAtual].Descricao
  else
    Result := '';
end;

function TDataModule1.CampoLancamentoDescricao: String;
begin
  result := CampoLancamentoValor('descricao');
end;

procedure TDataModule1.CarregarCamposDisponiveis(var pLista: TCheckListBox);
var
  i: Integer;
begin
  pLista.Items.Clear;

  for i := Low(fCamposLancamento) to High(fCamposLancamento) do
  begin
    if not fCamposLancamento[i].Obrigatorio then
      pLista.Items.Add(fCamposLancamento[i].Descricao);
  end;
end;

procedure TDataModule1.CarregarCamposUtilizados(var pLista: TCheckListBox);
var
  i: Integer;
begin
  pLista.Items.Clear;

  for i := Low(fCamposLancamento) to High(fCamposLancamento) do
  begin
    if fCamposLancamento[i].Obrigatorio then
      pLista.Items.Add(fCamposLancamento[i].Descricao);
  end;
end;

function TDataModule1.getDataSetType(Nome: String): TFieldType;
begin
  if (LowerCase(Nome) = 'decimal') then
    result := ftFloat
  else if (LowerCase(Nome) = 'data') then
    result := ftDateTime
  else if (LowerCase(Nome) = 'caractere') then
    result := ftString
  else if (LowerCase(Nome) = 'numeral') then
    result := ftInteger;
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

function TDataModule1.GerarChave(NomeGenerator: String; Testar: Boolean): Integer;
var
  Testado: Boolean;
  lComandoSQL: String;
begin
  result := 0;
  Testado := false;

  try
    while not Testado do
    begin
      qConsulta.Close;
      qConsulta.SQL.Clear;
      qConsulta.SQL.Add('SELECT GEN_ID(' + NomeGenerator + ', 1 ) AS chave FROM RDB$DATABASE');
      qConsulta.Open;

      if not qConsulta.IsEmpty then
        result := qConsulta.FieldByName('chave').AsInteger;

      if Testar then
      begin
        lComandoSQL := 'SELECT' + NewLine +
                       '  chave' + NewLine +
                       'FROM' + NewLine +
                       '  ' + Copy(NomeGenerator, 5, Length(NomeGenerator)) + NewLine +
                       'WHERE' + NewLine +
                       '  chave = ' + IntToStr(Result);

        if Consultar(lComandoSQL) = 0 then
          Testado := true;
      end
      else
        Testado := true;
    end;
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

function TDataModule1.TipoCampo(pTabela, pCampo: String): String;
const
  lConsulta = 'ConsultarCampo';
var
  lComandoSQL: String;
begin
  lComandoSQL := 'SELECT' + NewLine +
                 '  C.RDB$TYPE_NAME TIPO' + NewLine +
                 'FROM' + NewLine +
                 '  RDB$RELATION_FIELDS A,' + NewLine +
                 '  RDB$FIELDS B,' + NewLine +
                 '  RDB$TYPES C' + NewLine +
                 'WHERE' + NewLine +
                 '  B.RDB$FIELD_NAME = A.RDB$FIELD_SOURCE AND' + NewLine +
                 '  C.RDB$TYPE = B.RDB$FIELD_TYPE AND' + NewLine +
                 '  C.RDB$FIELD_NAME = ''RDB$FIELD_TYPE'' AND' + NewLine +
                 '  A.RDB$RELATION_NAME = ' + QuotedStr(UpperCase(Trim(pTabela))) + ' AND' + NewLine +
                 '  A.RDB$FIELD_NAME = ' + QuotedStr(UpperCase(Trim(pCampo))) + NewLine +
                 'ORDER BY' + NewLine +
                 '  RDB$FIELD_POSITION';

  if NovaConsulta(lConsulta, lComandoSQL) > 0 then
  begin
    if getQuery(lConsulta).FieldByName('TIPO').AsString = 'LONG' then
      result := 'INTEGER'
    else if getQuery(lConsulta).FieldByName('TIPO').AsString = 'DATE' then
      result := 'DATE'
    else if getQuery(lConsulta).FieldByName('TIPO').AsString = 'INT64' then
      result := 'DECIMAL'
    else if getQuery(lConsulta).FieldByName('TIPO').AsString = 'VARYING' then
      result := 'VARCHAR';
  end
  else
    result := 'NONE';
end;

end.

