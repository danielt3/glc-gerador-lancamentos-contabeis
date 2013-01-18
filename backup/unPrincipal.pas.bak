unit unPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, StdCtrls, DBGrids, DbCtrls, Buttons, Grids, CheckLst, FileCtrl,
  EditBtn, ActnList, ExtCtrls, PairSplitter, ShellCtrls, ColorBox,
  PopupNotifier, ZConnection, unDataModule, unListaCodigo, unGarbageCollector,
  unUtilitario, ExtendedNotebook, types;

type
  { TfrmPrincipal }
  TTipoAcao = (taNada, taInclusao, taEdicao);

  TfrmPrincipal = class(TForm)
    btnEditarEmpresa: TButton;
    btnEditarEmpresa1: TButton;
    btnExportarPlano: TButton;
    btnExportarPlano1: TButton;
    btnGravarEmpresa: TButton;
    btnGravarEmpresa1: TButton;
    btnGravarEmpresa2: TButton;
    btnGravarEmpresa3: TButton;
    btnImportarPlano: TButton;
    btnImportarPlano1: TButton;
    btnNovaEmpresa: TButton;
    btnNovaEmpresa1: TButton;
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    cmbEmpresa: TComboBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Conexao: TZConnection;
    dbgPlano: TDBGrid;
    dbgPlano1: TDBGrid;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    edtCNPJEmpresa: TEdit;
    edtCNPJEmpresa1: TEdit;
    edtCNPJEmpresa2: TEdit;
    edtCNPJEmpresa3: TEdit;
    edtCNPJEmpresa4: TEdit;
    edtCNPJEmpresa5: TEdit;
    edtCNPJEmpresa6: TEdit;
    edtCodigoEmpresa: TEdit;
    edtCodigoEmpresa1: TEdit;
    edtCodigoEmpresa3: TEdit;
    edtExportarPlano: TEdit;
    edtExportarPlano1: TEdit;
    edtImportarPlano: TEdit;
    edtImportarPlano1: TEdit;
    edtNomeEmpresa: TEdit;
    edtNomeEmpresa1: TEdit;
    edtNomeEmpresa2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    PageControl: TPageControl;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    pContador: TTabSheet;
    pClientes: TTabSheet;
    pPlanoContas: TTabSheet;
    pVinculador: TTabSheet;
    pEmpresa: TTabSheet;
    pIntegracao: TTabSheet;
    pAjuda: TTabSheet;
    Splitter1: TSplitter;
    TabSheet1: TTabSheet;
    procedure btnEditarEmpresaClick(Sender: TObject);
    procedure btnGravarEmpresaClick(Sender: TObject);
    procedure btnImportarPlanoClick(Sender: TObject);
    procedure btnNovaEmpresaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cmbEmpresaChange(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox12Click(Sender: TObject);
    procedure GroupBox4Click(Sender: TObject);
    procedure GroupBox8Click(Sender: TObject);
    procedure GroupBox9Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure EmpresaProxima(Sender: TObject);
    procedure EmpresaAnterior(Sender: TObject);
    procedure pEmpresaContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    //Geral
    fGarbageCollector: TGarbageCollector;
    //Empresa
    fEstadoEmpresa: TTipoAcao;
    fEmpresaAtual: Integer;
    fListaEmpresa: TListaCodigo;

    //Empresa
    procedure NovaEmpresa;
    procedure EditarEmpresa;
    function GravarEmpresa: Boolean;
    function ValidarEmpresa: Boolean;
    function GravarInserirEmpresa: Boolean;
    function GravarAlterarEmpresa: Boolean;
    procedure CarregarEmpresa(Empresa: Integer);
    procedure CarregarListaEmpresa;
    //Plano de Contas
    function  LimparPlanoDeContas(pEmpresa1: Integer): Boolean;
    function  ImportarPlanoDeContas(pEmpresa2: Integer; pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
    function  AdicionarPlanoDeContas(pEmpresa3: Integer; pExterno, pCodigo, pDescricao, pSintetico: String): Boolean;
    function  CarregarPlanoDeContas(pEmpresa4: Integer): Boolean;
  public
    { public declarations }
  end; 

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.PageControl1Change(Sender: TObject);
begin

end;

procedure TfrmPrincipal.NovaEmpresa;
begin
  edtCodigoEmpresa.Text := '';
  edtNomeEmpresa.Text := '';
  edtCNPJEmpresa.Text := '';
  fEstadoEmpresa:= taInclusao;

  edtCodigoEmpresa.Enabled := true;
  edtNomeEmpresa.Enabled := true;
  edtCNPJEmpresa.Enabled := true;
  edtCodigoEmpresa.SetFocus;
end;

procedure TfrmPrincipal.EditarEmpresa;
begin
  edtCodigoEmpresa.Enabled := true;
  edtNomeEmpresa.Enabled := true;
  edtCNPJEmpresa.Enabled := true;

  edtNomeEmpresa.SetFocus;
end;

function TfrmPrincipal.GravarEmpresa: Boolean;
begin
  result := false;

  try
    if ValidarEmpresa then
    begin
      if (fEstadoEmpresa = taInclusao) then
        result := GravarInserirEmpresa
      else
        result := GravarAlterarEmpresa;
    end;

    fEstadoEmpresa:= taNada;
    edtCodigoEmpresa.Enabled := false;
    edtNomeEmpresa.Enabled := false;
    edtCNPJEmpresa.Enabled := false;
  finally
  end;
end;

function TfrmPrincipal.ValidarEmpresa: Boolean;
begin
  result := false;

  if Vazio(edtCodigoEmpresa.Text) then
  begin
    MensagemAlerta('Por favor informar o código da empresa', 'Validar Empresa');
    edtCodigoEmpresa.SetFocus;
  end
  else if Vazio(edtNomeEmpresa.Text) then
  begin
    MensagemAlerta('Por favor informar o nome da empresa', 'Validar Empresa');
    edtNomeEmpresa.SetFocus;
  end
  else if Vazio(edtCNPJEmpresa.Text) then
  begin
    MensagemAlerta('Por favor informar o CNPJ da empresa', 'Validar Empresa');
    edtCNPJEmpresa.SetFocus;
  end
  else
    result := true;
end;

function TfrmPrincipal.GravarInserirEmpresa: Boolean;
var
  lComando: String;
begin
  result := false;

  try
    fEmpresaAtual := DataModule1.GerarChave('GEN_EMPRESA');
    lComando := 'INSERT INTO empresa (' +
                'chave,' +
                'codigo,' +
                'nome,' +
                'cnpj)' +
                'VALUES (' +
                '' + IntToStr(fEmpresaAtual) + ',' +
                '' + QuotedStr(ApenasNumeros(edtCodigoEmpresa.Text)) + ',' +
                '' + QuotedStr(Trim(edtNomeEmpresa.Text)) + ',' +
                '' + QuotedStr(ApenasNumeros(edtCNPJEmpresa.Text)) + ')';

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Inserir empresa.');
  end;
end;

function TfrmPrincipal.GravarAlterarEmpresa: Boolean;
var
  lComando: String;
begin
  result := false;

  try
    lComando := 'UPDATE' +
                '  empresa ' +
                'SET' +
                '  codigo = ' + QuotedStr(ApenasNumeros(edtCodigoEmpresa.Text)) + ',' +
                '  nome = ' + QuotedStr(Trim(edtNomeEmpresa.Text)) + ',' +
                '  cnpj = ' + QuotedStr(ApenasNumeros(edtCNPJEmpresa.Text)) + ' ' +
                'WHERE' +
                '  chave = ' + IntToStr(fEmpresaAtual);

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Alterar empresa.');
  end;
end;

procedure TfrmPrincipal.CarregarEmpresa(Empresa: Integer);
var
  lComando: String;
begin
  try
    lComando := 'SELECT' +
                '  chave,' +
                '  codigo,' +
                '  nome,' +
                '  cnpj ' +
                'FROM' +
                '  empresa ' +
                'WHERE' +
                '  chave = ' + IntToStr(Empresa);

    if (DataModule1.Consultar(lComando) > 0) then
    begin
      edtCodigoEmpresa.Text := DataModule1.qConsulta.FieldByName('codigo').AsString;
      edtNomeEmpresa.Text := DataModule1.qConsulta.FieldByName('nome').AsString;
      edtCNPJEmpresa.Text := FormatarCPFCNPJ(DataModule1.qConsulta.FieldByName('cnpj').AsString);
      fEmpresaAtual:= Empresa;

      CarregarPlanoDeContas(fEmpresaAtual);
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Alterar empresa.');
  end;
end;

procedure TfrmPrincipal.EmpresaProxima(Sender: TObject);
var
  i: Integer;
  Maximo: Integer;
begin
  i := cmbEmpresa.ItemIndex;
  Maximo := cmbEmpresa.Items.Count - 1;
  if i < Maximo then
    cmbEmpresa.ItemIndex := i + 1;
  cmbEmpresaChange(cmbEmpresa);
end;

procedure TfrmPrincipal.EmpresaAnterior(Sender: TObject);
var
  i: Integer;
begin
  i := cmbEmpresa.ItemIndex;

  if i > 0 then
    cmbEmpresa.ItemIndex := i - 1;
  cmbEmpresaChange(cmbEmpresa);
end;

procedure TfrmPrincipal.pEmpresaContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TfrmPrincipal.CarregarListaEmpresa;
var
  lComando: String;
begin
  try
    fListaEmpresa.Clear;
    cmbEmpresa.Items.Clear;

    lComando := 'SELECT' +
                '  chave,' +
                '  codigo,' +
                '  nome,' +
                '  cnpj ' +
                'FROM' +
                '  empresa ' +
                'ORDER BY' +
                '  codigo';

    if (DataModule1.Consultar(lComando) > 1) then
    begin
      DataModule1.qConsulta.First;
      while not DataModule1.qConsulta.EOF do
      begin
        cmbEmpresa.Items.Add(AlignLeft(DataModule1.qConsulta.FieldByName('nome').AsString, 30) + '-' + AlignRight(DataModule1.qConsulta.FieldByName('codigo').AsString, 6));
        fListaEmpresa.Add(DataModule1.qConsulta.FieldByName('chave').AsInteger);

        DataModule1.qConsulta.Next;
      end;

      if DataModule1.qConsulta.Locate('chave', IntToStr(fEmpresaAtual), []) then
        cmbEmpresa.ItemIndex:= fListaEmpresa.IndexOf(fEmpresaAtual)
      else
        cmbEmpresa.ItemIndex:= 0;

      cmbEmpresaChange(cmbEmpresa);
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Alterar empresa.');
  end;
end;

function TfrmPrincipal.LimparPlanoDeContas(pEmpresa1: Integer): Boolean;
var
  lComandoSQL: String;
begin
  lComandoSQL := 'update' + NewLine +
                 '  PLANO_CONTAS' + NewLine +
                 'set' + NewLine +
                 '  EMPRESA_OLD = EMPRESA,' + NewLine +
                 '  EMPRESA = 0' + NewLine +
                 'where' + NewLine +
                 '  EMPRESA = ' + IntToStr(pEmpresa1);

  result := DataModule1.Executar(lComandoSQL);
end;

function TfrmPrincipal.ImportarPlanoDeContas(pEmpresa2: Integer; pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
var
  lArquivo: TStringList;
  i: Integer;

  lExterno: String;
  lCodigo: String;
  lDescricao: String;
  lSintetico: String;
begin
  result := false;
  try
    if FileExists(pNomeArquivo) then
    begin
      LimparPlanoDeContas(pEmpresa2);

      lArquivo := TStringList.Create;

      try
        lArquivo.LoadFromFile(pNomeArquivo);

        if Assigned(pBarraProgresso) then
        begin
          pBarraProgresso.Visible := true;
          pBarraProgresso.Min := 0;
          pBarraProgresso.Max := lArquivo.Count;
          pBarraProgresso.Step := 0;
        end;

        for i := 0 to lArquivo.Count - 1 do
        begin
          lExterno := IntToStr(StrToIntDef(Copy(lArquivo.Strings[i], 1, 7), 0));
          lCodigo := ApenasNumeros(Copy(lArquivo.Strings[i], 8, 20));
          lDescricao:= Trim(Copy(lArquivo.Strings[i], 28, 40));
          lSintetico:= Copy(lArquivo.Strings[i], 68, 1);

          AdicionarPlanoDeContas(fEmpresaAtual, lExterno, lCodigo, lDescricao, lSintetico);
          pBarraProgresso.StepBy(1);
        end;
      finally
        FreeAndNil(lArquivo);
      end;
    end;

    result := true;
  except on e:exception do
    MensagemErro(e.Message, 'Importar Plano');
  end;
end;

function TfrmPrincipal.AdicionarPlanoDeContas(pEmpresa3: Integer; pExterno, pCodigo, pDescricao, pSintetico: String): Boolean;
var
  lComandoSQL: String;
begin
  lComandoSQL := 'insert into PLANO_CONTAS (' + NewLine +
                 '  EMPRESA,' + NewLine +
                 '  EMPRESA_OLD,' + NewLine +
                 '  CODIGO_EXTERNO,' + NewLine +
                 '  CODIGO,' + NewLine +
                 '  DESCRICAO,' + NewLine +
                 '  SINTETICA)' + NewLine +
                 'values (' + NewLine +
                 '  ' + IntToStr(pEmpresa3) + ', ' + NewLine +
                 '  0, ' + NewLine +
                 '  ' + QuotedStr(Trim(pExterno)) + ', ' + NewLine +
                 '  ' + QuotedStr(Trim(pCodigo)) + ', ' + NewLine +
                 '  ' + QuotedStr(Trim(pDescricao)) + ', ' + NewLine +
                 '  ' + QuotedStr(Trim(pSintetico)) + ')';

  result := DataModule1.Executar(lComandoSQL);
end;

function TfrmPrincipal.CarregarPlanoDeContas(pEmpresa4: Integer): Boolean;
var
  lComandoSQL: String;
begin
  lComandoSQL := 'select' + NewLine +
                 '  CODIGO_EXTERNO as "Cód Externo",' + NewLine +
                 '  CODIGO as "Código",' + NewLine +
                 '  DESCRICAO as "Descrição",' + NewLine +
                 '  SINTETICA as "Sintética"' + NewLine +
                 'from' + NewLine +
                 '  PLANO_CONTAS' + NewLine +
                 'where' + NewLine +
                 '  EMPRESA = ' + IntToStr(pEmpresa4);

  result := DataModule1.NovaConsulta('PlanoContasMain', lComandoSQL) > 0;
  dbgPlano.DataSource := DataModule1.getDataSource('PlanoContasMain');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  fGarbageCollector := TGarbageCollector.Create;

  fListaEmpresa := TListaCodigo.Create;
  fGarbageCollector.Add(fListaEmpresa);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fGarbageCollector);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  CarregarListaEmpresa;
end;

procedure TfrmPrincipal.GroupBox12Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.GroupBox4Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.GroupBox8Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.GroupBox9Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.Label3Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.Label4Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.Label6Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.Label9Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.btnNovaEmpresaClick(Sender: TObject);
begin
  NovaEmpresa;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  DataModule1.Conexao.Connect;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtImportarPlano.Text := OpenDialog1.FileName;
end;

procedure TfrmPrincipal.cmbEmpresaChange(Sender: TObject);
begin
  CarregarEmpresa(fListaEmpresa.Value(cmbEmpresa.ItemIndex));
end;

procedure TfrmPrincipal.Edit2Change(Sender: TObject);
begin

end;

procedure TfrmPrincipal.btnGravarEmpresaClick(Sender: TObject);
begin
  GravarEmpresa;
  CarregarListaEmpresa;
end;

procedure TfrmPrincipal.btnImportarPlanoClick(Sender: TObject);
begin
  if FileExists(edtImportarPlano.Text) then
  begin
    if ImportarPlanoDeContas(fEmpresaAtual, edtImportarPlano.Text, ProgressBar1)then
    begin
      MensagemSucesso('Plano de contas importado com sucesso!', 'Importação de plano de contas');
    end;
  end;
end;

procedure TfrmPrincipal.btnEditarEmpresaClick(Sender: TObject);
begin
  EditarEmpresa;
end;

end.

