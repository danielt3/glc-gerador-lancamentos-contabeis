unit unPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, StdCtrls, DBGrids, DbCtrls, Buttons, Grids, CheckLst, FileCtrl,
  EditBtn, ActnList, ExtCtrls, PairSplitter, ShellCtrls, ColorBox,
  PopupNotifier, Calendar, Arrow, MaskEdit, ZConnection, unDataModule,
  unListaCodigo, unGarbageCollector, unUtilitario, db, ExtendedNotebook,
  RTTICtrls, types, ZAbstractRODataset, ZDataset, unNovoCampo,
  unConsultarPlanoContas;

type
  { TfrmPrincipal }
  TTipoAcao = (taNada, taInclusao, taEdicao);

  TfrmPrincipal = class(TForm)
    Arrow1: TArrow;
    Arrow2: TArrow;
    Arrow3: TArrow;
    Arrow4: TArrow;
    btnAdicionarDadosCampo: TButton;
    btnAdicionarDadosCampo1: TButton;
    btnExcluirDadosCampo: TButton;
    btnEditarEmpresa: TButton;
    btnEditarEmpresa1: TButton;
    btnExportar: TButton;
    btnGravarEmpresa: TButton;
    btnGravarEmpresa1: TButton;
    btnGravarEmpresa2: TButton;
    btnGravarEmpresa3: TButton;
    btnImportar: TButton;
    btnNovaEmpresa: TButton;
    btnNovaEmpresa1: TButton;
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    btnGravarLayout: TButton;
    btnCancelarLayout: TButton;
    btnEditarLayout: TButton;
    btnNovoLayout: TButton;
    btnGravarLancamento: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    chkCamposDisponiveis: TCheckListBox;
    chkCamposUtilizados: TCheckListBox;
    chkLayoutsDisponiveis: TCheckListBox;
    chkLayoutsUtilizados: TCheckListBox;
    cmbEmpresa: TComboBox;
    cmbPlanoContasTipo2: TDBLookupComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    cmbLancamentoLayout: TComboBox;
    cmbTipoImportacao: TComboBox;
    cmbConjuntoImportacao: TComboBox;
    cmbConjuntoExportacao: TComboBox;
    cmbTipoExportacao: TComboBox;
    Conexao: TZConnection;
    dhInicio: TDateEdit;
    dhFim: TDateEdit;
    dbgDadosCampos: TDBGrid;
    dbgPlano1: TDBGrid;
    dbgLayouts: TDBGrid;
    dbgLancamento: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    edtCodigoDebitar: TEdit;
    edtCodigoCreditar: TEdit;
    edtClassificacaoDebitar: TEdit;
    edtClassificacaoCreditar: TEdit;
    edtLote: TEdit;
    edtFormatoCampo: TEdit;
    edtNomeDebitar: TEdit;
    edtNomeCreditar: TEdit;
    edtNomeLayout: TEdit;
    dbgPlano: TDBGrid;
    cmbPlanoContasTipo: TDBLookupComboBox;
    edtPlanoContasCodigo: TEdit;
    edtPlanoContasDescricao2: TEdit;
    edtPlanoContasClassificacao: TEdit;
    edtPlanoContasDescricao: TEdit;
    edtMascaraPlanoContas: TEdit;
    edtPlanoContasClassificacao2: TEdit;
    edtCNPJEmpresa: TEdit;
    edtCodigoEmpresa: TEdit;
    edtCodigoVinculador: TEdit;
    edtExportar: TEdit;
    edtImportar: TEdit;
    edtNomeEmpresa: TEdit;
    edtNomeVinculador: TEdit;
    edtHistorico: TEdit;
    edtTamanhoCampo: TEdit;
    edtTipoCampo: TEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    gbTabelasUtilizadas: TGroupBox;
    gdbOpcao: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    gbInformacoes: TGroupBox;
    GroupBox17: TGroupBox;
    gbLancamentos: TGroupBox;
    gbNomeLayout: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    gbTabelasDisponiveis: TGroupBox;
    gdbCaracteristicas: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
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
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    lblTotalLancamento: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    memAnotacoes: TMemo;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl: TPageControl;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    pContador: TTabSheet;
    pClientes: TTabSheet;
    popEmpresa: TPopupMenu;
    popLancamentos: TPopupMenu;
    popVinculador: TPopupMenu;
    popPlanoContas: TPopupMenu;
    popLayout: TPopupMenu;
    pPlanoContas: TTabSheet;
    pVinculador: TTabSheet;
    pEmpresa: TTabSheet;
    pIntegracao: TTabSheet;
    pAjuda: TTabSheet;
    Splitter1: TSplitter;
    pLancamentos: TTabSheet;
    pLeiaute: TTabSheet;
    procedure Arrow1Click(Sender: TObject);
    procedure Arrow2Click(Sender: TObject);
    procedure Arrow3Click(Sender: TObject);
    procedure Arrow4Click(Sender: TObject);
    procedure btnExcluirDadosCampoClick(Sender: TObject);
    procedure btnCancelarLayoutClick(Sender: TObject);
    procedure btnEditarEmpresa1Click(Sender: TObject);
    procedure btnEditarEmpresaClick(Sender: TObject);
    procedure btnEditarLayoutClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnGravarEmpresa1Click(Sender: TObject);
    procedure btnGravarEmpresa2Click(Sender: TObject);
    procedure btnGravarEmpresa3Click(Sender: TObject);
    procedure btnGravarEmpresaClick(Sender: TObject);
    procedure btnGravarLancamentoClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnNovaEmpresa1Click(Sender: TObject);
    procedure btnNovaEmpresaClick(Sender: TObject);
    procedure btnNovoLayoutClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure btnGravarLayoutClick(Sender: TObject);
    procedure btnAdicionarDadosCampoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure chkCamposDisponiveisClick(Sender: TObject);
    procedure chkCamposUtilizadosClick(Sender: TObject);
    procedure cmbEmpresaChange(Sender: TObject);
    procedure cmbLancamentoLayoutChange(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure dbgLancamentoDblClick(Sender: TObject);
    procedure dbgLancamentoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgLayoutsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgPlano1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgPlanoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgPlanoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure edtCNPJEmpresaKeyPress(Sender: TObject; var Key: char);
    procedure edtCodigoCreditarExit(Sender: TObject);
    procedure edtCodigoCreditarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoCreditarKeyPress(Sender: TObject; var Key: char);
    procedure edtCodigoDebitarExit(Sender: TObject);
    procedure edtCodigoDebitarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoDebitarKeyPress(Sender: TObject; var Key: char);
    procedure edtLoteKeyPress(Sender: TObject; var Key: char);
    procedure edtMascaraPlanoContasChange(Sender: TObject);
    procedure edtPlanoContasClassificacao2Change(Sender: TObject);
    procedure edtPlanoContasClassificacao2KeyPress(Sender: TObject;
      var Key: char);
    procedure edtPlanoContasClassificacaoKeyPress(Sender: TObject; var Key: char
      );
    procedure edtPlanoContasDescricao2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memAnotacoesExit(Sender: TObject);
    procedure cmbLookupKeyPress(Sender: TObject; var Key: char);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);

    procedure EmpresaProxima(Sender: TObject);
    procedure EmpresaAnterior(Sender: TObject);
    procedure GravarInserirCampo(pNomeCampo: String);
    procedure DateValidator(Sender: TObject; var Key: char);
    procedure DecimalValidator(Sender: TObject; var Key: char);
    procedure DecimalExit(Sender: TObject);
    procedure ComboValidator(Sender: TObject; var Key: char);
    procedure CheckboxDrawItem(Control: TWinControl; Index: Integer; ARect: TRect; State: TOwnerDrawState);
  private
    //Geral
    fGarbageCollector: TGarbageCollector;
    //Empresa
    fEstadoEmpresa: TTipoAcao;
    fEmpresaAtual: Integer;
    fListaEmpresa: TListaCodigo;
    //Plano de Contas
    fEstadoPlano: TTipoAcao;
    fPlanoAtual: Integer;
    fListaTipoPlano: TStringList;
    //Vinculadores
    fEstadoVinculador: TTipoAcao;
    fVinculadorAtual: Integer;
    fListaDebito: TStringList;
    fListaDebito2: TStringList;
    fListaDebito3: TStringList;
    fListaDebito4: TStringList;
    fListaCredito: TStringList;
    fListaCredito2: TStringList;
    fListaCredito3: TStringList;
    fListaCredito4: TStringList;
    fLayoutsDisponiveis: TStringList;
    fLayoutsUtilizados: TStringList;
    //Layouts
    fLayoutAtual: Integer;
    fLancamentoLayoutAtual: Integer;
    fEstadoLayout: TTipoAcao;
    //Lançamentos
    fLancamentoLayouts: TStringList;
    fVinculadoresLayout: TStringList;
    fEstadoLancamento: TTipoAcao;
    fLancamentoAtual: Integer;
    fListaCampos: TList;
    fListaCamposNome: TStringList;
    fLeft: Integer;
    fTop: Integer;
    fLength: Integer;
    fCampoEntrada: TEdit;
    fCampoSaida: TEdit;

    //Empresa
    procedure NovaEmpresa;
    procedure EditarEmpresa;
    procedure ExcluirEmpresa;
    function GravarEmpresa: Boolean;
    function ValidarEmpresa: Boolean;
    function GravarInserirEmpresa: Boolean;
    function GravarAlterarEmpresa: Boolean;
    procedure CarregarEmpresa(Empresa: Integer);
    procedure CarregarListaEmpresa;
    procedure GravarAnotacoes;
    //Plano de Contas
    function  LimparPlanoDeContas(pEmpresa1: Integer): Boolean;
    function  ImportarPlanoDeContas(pEmpresa2: Integer; pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
    function  AdicionarPlanoDeContas(pEmpresa3: Integer; pExterno, pCodigo, pDescricao, pSintetico: String): Boolean;
    function  CarregarPlanoDeContas(pEmpresa4: Integer): Boolean;
    procedure HabilitarAbasAdicionais(Habilitar: Boolean);
    function  CarregarTelaPlanoDeContas: Boolean;
    procedure PrepararComboTipoPlanoContas;
    procedure CarregarCombosPlano;
    procedure ExcluirPlanoDeContas;
    procedure LimparTelaPlanoContas;
    procedure NovoPlanoContas;
    procedure EditarPlanoContas;
    procedure CancelarPlanoContas;
    function GravarPlanoContas: Boolean;
    function GravarInserirPlanoContas: Boolean;
    function GravarAlterarPlanoContas: Boolean;
    function ProximoCodigoPlanoConta: String;
    procedure ConsultarVinculadorDebito(pRegistro: Integer);
    procedure ConsultarVinculadorCredito(pRegistro: Integer);
    function BuscarPlanoNaLista(pListaPlano: TStringList; Codigo: String): Integer;
    //Vinculadores
    function  CarregarVinculadores(pEmpresa4: Integer): Boolean;
    procedure LimparTelaVinculadores;
    procedure HabilitarVinculadores(Habilitar: Boolean);
    procedure NovoVinculador;
    procedure EditarVinculador;
    procedure ExcluirVinculador;
    procedure CancelarVinculador;
    function  ValidarVinculador: Boolean;
    function  CarregarVinculador: Boolean;
    function ProximoCodigoVinculador: String;
    function GravarVinculador: Boolean;
    function GravarInserirVinculador: Boolean;
    function GravarAlterarVinculador: Boolean;
    function CarregarLayoutsDisponiveis(Todos: Boolean = false): Boolean;
    function CarregarLayoutsUtilizados: Boolean;
    function GravarLayoutsUtilizados: Boolean;
    //Layouts
    function  CarregarLayouts(pEmpresa4: Integer): Boolean;
    procedure CarregarLayout;
    procedure CarregarCamposLayout;
    procedure LimparTelaLayouts;
    procedure HabilitarLayout(Habilitar: Boolean);
    procedure NovoLayout;
    procedure ExcluirLayout;
    procedure CancelarLayout;
    procedure EditarLayout;
    function  TemCampoSelecionado(pLista: TCheckListBox): Integer;
    function GravarLayout: Boolean;
    function ValidarLayout: Boolean;
    function GravarInserirLayout: Boolean;
    function GravarInserirLayoutCampos: Boolean;
    function GravarAlterarLayout: Boolean;
    function GravarAlterarLayoutCampos: Boolean;
    procedure MostrarDadosCampo(pDescricao: String; HabilitarInsercao: Boolean);
    procedure CarregarListaDadosCampo(pNomeCampo: String);
    function  PodeAdicionarCampo(i: Integer): Boolean;
    function  CampoSendoUtilizado(pNomeCampo: String): Boolean;
    //Cliente
    procedure CarregarLancamentoLayouts;
    procedure MontarTelaLancamento;
    procedure CriarCampoLancamento(pNomeCampo: String);
    procedure ConsultarLancamentos;
    function  ExisteLancamentos: Boolean;
    procedure CarregarListaDadosCampoLancamento(var pCombo: TComboBox; pNomeCampo: String); overload;
    procedure CarregarListaVinculadorCampoLancamento(var pCombo: TComboBox);
    procedure NovoLancamento;
    procedure EditarLancamento;
    procedure ExcluirLancamento;
    procedure CreateStringField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
    procedure CreateDecimalField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
    procedure CreateDateField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
    procedure CreateVinculadorField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
    procedure CreateComboField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
    procedure SetButtonField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
    procedure GravarLancamento;
    procedure GravarLancamentoInserir;
    procedure GravarLancamentoAlterar;
    function  ValidarLancamento: Boolean;
    function getValue(pNomeCampo: String): String;
    procedure setValue(pNomeCampo: String); Overload;
    //Integração
    function  ExportarDominio(Empresa: Integer; pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
    function  ExportarTabela(Empresa: Integer; pNomeTabela, pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
    function  ImportarTabelas(pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
    procedure QuebrarString(var pLista: TStringList; pString: String);
    function  AlignLeft(Texto: String; Tamanho: Integer; Caractere: Char = ' '): String;
    function  AlignRight(Texto: String; Tamanho: Integer; Caractere: Char = ' '): String;
    procedure TotalizarValores;
  public
    { public declarations }
  end; 

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

{ TfrmPrincipal }

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

procedure TfrmPrincipal.ExcluirEmpresa;
var
  lComandoSQL: String;
begin
  if (fEmpresaAtual > 0) and (MensagemConfirmacao('Deseja realmente excluir essa empresa?', 'GLC')) then
  begin
    lComandoSQL := 'DELETE FROM' + NewLine +
                   '  empresa' + NewLine +
                   'WHERE' + NewLine +
                   '  chave = ' + IntToStr(fEmpresaAtual);

    DataModule1.Executar(lComandoSQL);

    CarregarListaEmpresa;

    MensagemSucesso('Empresa excluida com sucesso!', 'GLC');
  end;
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

      fEstadoEmpresa:= taNada;
      edtCodigoEmpresa.Enabled := false;
      edtNomeEmpresa.Enabled := false;
      edtCNPJEmpresa.Enabled := false;
    end;
  finally
  end;
end;

function TfrmPrincipal.ValidarEmpresa: Boolean;
begin
  result := false;

  if Vazio(edtCodigoEmpresa.Text) then
  begin
    MensagemAlerta('Por favor informar o código da empresa', 'Erro');
    edtCodigoEmpresa.SetFocus;
  end
  else if Vazio(edtNomeEmpresa.Text) then
  begin
    MensagemAlerta('Por favor informar o nome da empresa', 'Erro');
    edtNomeEmpresa.SetFocus;
  end
  else if Vazio(edtCNPJEmpresa.Text) then
  begin
    MensagemAlerta('Por favor informar o CNPJ da empresa', 'Erro');
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
      fLancamentoLayoutAtual := 0;

      CarregarPlanoDeContas(fEmpresaAtual);
      CarregarVinculadores(fEmpresaAtual);
      CarregarLayouts(fEmpresaAtual);
      CarregarLancamentoLayouts;
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

procedure TfrmPrincipal.cmbLookupKeyPress(Sender: TObject; var Key: char);
var
  teste: String;
begin
  teste := TComboBox(Sender).Text;

  if (Key <> #8) and (TComboBox(Sender).Text <> '') and (TComboBox(Sender).Items.IndexOf(TComboBox(Sender).Text + Key) = -1) then
    Key := #0;

  TComboBox(Sender).SelStart := Length(TComboBox(Sender).Text);
end;

procedure TfrmPrincipal.MenuItem1Click(Sender: TObject);
begin
  ExcluirEmpresa;
end;

procedure TfrmPrincipal.MenuItem2Click(Sender: TObject);
begin
  ExcluirPlanoDeContas;
end;

procedure TfrmPrincipal.MenuItem3Click(Sender: TObject);
begin
  ExcluirVinculador;
end;

procedure TfrmPrincipal.MenuItem4Click(Sender: TObject);
begin
  ExcluirLayout;
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

    if (DataModule1.Consultar(lComando) > 0) then
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

procedure TfrmPrincipal.GravarAnotacoes;
var
  lComandoSQL: String;
begin
  lComandoSQL := 'update' + NewLine +
                 '  EMPRESA' + NewLine +
                 'set' + NewLine +
                 '  ANOTACOES = ' + QuotedStr(memAnotacoes.Lines.Text) + NewLine +
                 'where' + NewLine +
                 '  EMPRESA = ' + IntToStr(fEmpresaAtual);

  DataModule1.Executar(lComandoSQL);
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
          if Assigned(pBarraProgresso) then
            pBarraProgresso.StepBy(1);
        end;
      finally
        FreeAndNil(lArquivo);
      end;
    end;

    CarregarPlanoDeContas(fEmpresaAtual);

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
  teste: Integer;
begin
  DataModule1.MascaraPlanoContas := edtMascaraPlanoContas.Text;

  lComandoSQL := 'select' + NewLine +
                 '  CHAVE,' + NewLine +
                 '  CODIGO_EXTERNO as codigo,' + NewLine +
                 '  CODIGO as classificacao,' + NewLine +
                 '  DESCRICAO as descricao,' + NewLine +
                 '  SINTETICA as sintetica' + NewLine +
                 'from' + NewLine +
                 '  PLANO_CONTAS' + NewLine +
                 'where' + NewLine +
                 '  EMPRESA = ' + IntToStr(pEmpresa4);

  if ApenasNumeros(edtPlanoContasClassificacao2.Text) <> EmptyStr then
    lComandoSQL := lComandoSQL + '  AND CODIGO LIKE ' + QuotedStr(ApenasNumeros(edtPlanoContasClassificacao2.Text) + '%');

  if trim(edtPlanoContasDescricao2.Text) <> EmptyStr then
    lComandoSQL := lComandoSQL + '  AND descricao LIKE ' + QuotedStr(Trim(edtPlanoContasDescricao2.Text) + '%');

  if (cmbPlanoContasTipo2.ItemIndex = 1) then
    lComandoSQL := lComandoSQL + '  AND sintetica = ' + QuotedStr('S') + NewLine
  else if (cmbPlanoContasTipo2.ItemIndex = 2) then
    lComandoSQL := lComandoSQL + '  AND sintetica = ' + QuotedStr('N') + NewLine;

  DataModule1.qPlanoContas.Close;
  DataModule1.qPlanoContas.SQl.Clear;
  DataModule1.qPlanoContas.SQL.Add(lComandoSQL);
  DataModule1.qPlanoContas.SQL.SaveToFile(ExtractFilePath(ApplicationName) + 'PlanoContas.sql');
  DataModule1.qPlanoContas.Open;

  CarregarCombosPlano;

  teste := DataModule1.qPlanoContas.RowsAffected;
  result := not DataModule1.qPlanoContas.IsEmpty;
  dbgPlano.DataSource := DataModule1.dsPlanoContas;
  CarregarTelaPlanoDeContas;
  HabilitarAbasAdicionais(not DataModule1.qPlanoContas.IsEmpty);
end;

procedure TfrmPrincipal.HabilitarAbasAdicionais(Habilitar: Boolean);
begin
  pLeiaute.TabVisible := Habilitar;
  pVinculador.TabVisible := Habilitar;
end;

function TfrmPrincipal.CarregarTelaPlanoDeContas: Boolean;
begin
  if not (DataModule1.qPlanoContas.IsEmpty) then
  begin
    fPlanoAtual := DataModule1.qPlanoContas.FieldByName('chave').AsInteger;
    edtPlanoContasCodigo.Text := DataModule1.qPlanoContas.FieldByName('codigo').AsString;
    edtPlanoContasClassificacao.Text := MascararTexto(DataModule1.qPlanoContas.FieldByName('classificacao').AsString, edtMascaraPlanoContas.Text);
    if (DataModule1.qPlanoContas.FieldByName('sintetica').AsString = 'S') then
      cmbPlanoContasTipo.ItemIndex := 0
    else
      cmbPlanoContasTipo.ItemIndex := 1;
    edtPlanoContasDescricao.Text := DataModule1.qPlanoContas.FieldByName('descricao').AsString;
  end
  else
  begin
    fPlanoAtual := 0;
    edtPlanoContasCodigo.Text := '';
    edtPlanoContasClassificacao.Text := '';
    cmbPlanoContasTipo.ItemIndex := 0;
    edtPlanoContasDescricao.Text := '';
  end;
end;

procedure TfrmPrincipal.PrepararComboTipoPlanoContas;
begin
  if not Assigned(fListaTipoPlano) then
    fListaTipoPlano := TStringList.Create;

  cmbPlanoContasTipo.Clear;
  cmbPlanoContasTipo2.Clear;

  fListaTipoPlano.Add('S');
  fListaTipoPlano.Add('A');

  cmbPlanoContasTipo.AddItem('Sintética', TObject('S'));
  cmbPlanoContasTipo.AddItem('Analítica', TObject('A'));
  cmbPlanoContasTipo.ItemIndex := 0;
  cmbPlanoContasTipo2.AddItem('Todas', TObject('T'));
  cmbPlanoContasTipo2.AddItem('Sintética', TObject('S'));
  cmbPlanoContasTipo2.AddItem('Analítica', TObject('A'));
  cmbPlanoContasTipo2.ItemIndex := 0;
end;

procedure TfrmPrincipal.CarregarCombosPlano;
var
  lChave: String;
begin
  DataModule1.qPlanoContas.First;
  fListaDebito.Clear;
  fListaCredito.Clear;
  fListaDebito2.Clear;
  fListaCredito2.Clear;
  fListaDebito3.Clear;
  fListaCredito3.Clear;
  fListaDebito4.Clear;
  fListaCredito4.Clear;

  while not DataModule1.qPlanoContas.Eof do
  begin
    if (DataModule1.qPlanoContas.FieldByName('sintetica').AsString <> 'S') then
    begin
      lChave := DataModule1.qPlanoContas.FieldByName('CHAVE').AsString;
      if (DataModule1.qPlanoContas.FieldByName('CHAVE').AsInteger = 2692) then
        Application.ProcessMessages;
      fListaDebito.Add(lChave);
      fListaCredito.Add(lChave);
      fListaDebito2.Add(DataModule1.qPlanoContas.FieldByName('codigo').AsString);
      fListaCredito2.Add(DataModule1.qPlanoContas.FieldByName('codigo').AsString);
      fListaDebito3.Add(MascararTexto(DataModule1.qPlanoContas.FieldByName('classificacao').AsString, edtMascaraPlanoContas.Text));
      fListaCredito3.Add(MascararTexto(DataModule1.qPlanoContas.FieldByName('classificacao').AsString, edtMascaraPlanoContas.Text));
      fListaDebito4.Add(DataModule1.qPlanoContas.FieldByName('descricao').AsString);
      fListaCredito4.Add(DataModule1.qPlanoContas.FieldByName('descricao').AsString);
    end;

    DataModule1.qPlanoContas.Next;
  end;

  DataModule1.qPlanoContas.First;
end;

procedure TfrmPrincipal.ExcluirPlanoDeContas;
var
  lComandoSQL: String;
begin
  if (fEmpresaAtual > 0) and (MensagemConfirmacao('Deseja realmente excluir esse plano de contas?', 'GLC')) then
  begin
    lComandoSQL := 'DELETE FROM' + NewLine +
                   '  plano_contas' + NewLine +
                   'WHERE' + NewLine +
                   '  chave = ' + IntToStr(fPlanoAtual);

    DataModule1.Executar(lComandoSQL);

    CarregarPlanoDeContas(fEmpresaAtual);

    MensagemSucesso('Plano de Contas excluido com sucesso!', 'GLC');
  end;
end;

procedure TfrmPrincipal.LimparTelaPlanoContas;
begin
  edtPlanoContasCodigo.Text := '';
  edtPlanoContasClassificacao.Text := '';
  edtPlanoContasClassificacao2.Text := '';
  cmbPlanoContasTipo.ItemIndex := 0;
  cmbPlanoContasTipo2.ItemIndex := 0;
  edtPlanoContasDescricao.Text := '';
  edtPlanoContasDescricao2.Text := '';
end;

procedure TfrmPrincipal.NovoPlanoContas;
begin
  LimparTelaPlanoContas;
  fEstadoPlano := taInclusao;

  //edtPlanoContasCodigo.Enabled := true;
  edtPlanoContasCodigo.Text := ProximoCodigoPlanoConta;
  edtPlanoContasClassificacao.Enabled := true;
  edtPlanoContasDescricao.Enabled := true;
  cmbPlanoContasTipo.Enabled := true;

  PageControl.ActivePage := pContador;
  PageControl2.ActivePage := pPlanoContas;
  cmbPlanoContasTipo.SetFocus;
end;

procedure TfrmPrincipal.EditarPlanoContas;
begin
  if not (DataModule1.qPlanoContas.IsEmpty) then
  begin
    CarregarTelaPlanoDeContas;
    fEstadoPlano := taEdicao;

    //edtPlanoContasCodigo.Enabled := true;
    edtPlanoContasClassificacao.Enabled := true;
    edtPlanoContasDescricao.Enabled := true;
    cmbPlanoContasTipo.Enabled := true;

    PageControl.ActivePage := pContador;
    PageControl2.ActivePage := pPlanoContas;
    edtPlanoContasDescricao.SetFocus;
  end;
end;

procedure TfrmPrincipal.CancelarPlanoContas;
begin
  CarregarTelaPlanoDeContas;
  fEstadoPlano := taNada;

  edtPlanoContasCodigo.Enabled := false;
  edtPlanoContasClassificacao.Enabled := false;
  edtPlanoContasDescricao.Enabled := false;
  cmbPlanoContasTipo.Enabled := false;
end;

function TfrmPrincipal.GravarPlanoContas: boolean;
var
  lComandoSQL: String;
  lPlanoAtual: Integer;
begin
  result := false;
  if (fEstadoPlano = taInclusao) then
  begin
    result := GravarInserirPlanoContas;
    lPlanoAtual := fPlanoAtual;
  end
  else if (fEstadoPlano = taEdicao) then
  begin
    lPlanoAtual := fPlanoAtual;
    result := GravarAlterarPlanoContas;
  end;

  CarregarPlanoDeContas(fEmpresaAtual);
  DataModule1.qPlanoContas.Locate('CHAVE', IntToStr(lPlanoAtual), []);
  CarregarTelaPlanoDeContas;

  edtPlanoContasCodigo.Enabled := false;
  edtPlanoContasClassificacao.Enabled := false;
  edtPlanoContasDescricao.Enabled := false;
  cmbPlanoContasTipo.Enabled := false;
end;

function TfrmPrincipal.GravarInserirPlanoContas: Boolean;
var
  lComando: String;
begin
  result := false;

  try
    fPlanoAtual := DataModule1.GerarChave('GEN_PLANO_CONTAS');
    lComando := 'INSERT INTO plano_contas (' + NewLine +
                'chave,' + NewLine +
                'empresa,' + NewLine +
                'codigo_externo,' + NewLine +
                'codigo,' + NewLine +
                'descricao,' + NewLine +
                'sintetica)' + NewLine +
                'VALUES (' + NewLine +
                '' + IntToStr(fPlanoAtual) + ',' + NewLine +
                '' + IntToStr(fEmpresaAtual) + ',' + NewLine +
                '' + QuotedStr(ApenasNumeros(edtPlanoContasCodigo.Text)) + ',' + NewLine +
                '' + QuotedStr(ApenasNumeros(edtPlanoContasClassificacao.Text)) + ',' + NewLine +
                '' + QuotedStr(Trim(edtPlanoContasDescricao.Text)) + ',' + NewLine +
                '' + QuotedStr(fListaTipoPlano.Strings[cmbPlanoContasTipo.ItemIndex]) + ')';

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Inserir plano de conta.');
  end;
end;

function TfrmPrincipal.GravarAlterarPlanoContas: Boolean;
var
  lComando: String;
  lTipo: String;
begin
  result := false;

  try
    lComando := 'UPDATE plano_contas SET' + NewLine +
                '  codigo_externo = ' + QuotedStr(ApenasNumeros(edtPlanoContasCodigo.Text)) + ',' + NewLine +
                '  codigo = ' + QuotedStr(ApenasNumeros(edtPlanoContasClassificacao.Text)) + ',' + NewLine +
                '  descricao = ' + QuotedStr(Trim(edtPlanoContasDescricao.Text)) + ',' + NewLine +
                '  sintetica = ' + QuotedStr(fListaTipoPlano.Strings[cmbPlanoContasTipo.ItemIndex]) + NewLine +
                'WHERE' + NewLine +
                '  chave = ' + IntToStr(fPlanoAtual);

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Inserir plano de conta.');
  end;
end;

function TfrmPrincipal.ProximoCodigoPlanoConta: String;
var
  lComandoSQL: String;
begin
  lComandoSQL := 'SELECT' + NewLine +
                 '  MAX(CAST(codigo_externo AS INT)) as codigo' + NewLine +
                 'FROM' + NewLine +
                 '  plano_contas a' + NewLine +
                 'WHERE' + NewLine +
                 '  empresa = ' + IntToStr(fEmpresaAtual) + ' AND' + NewLine +
                 '  codigo_externo <= ''999999''';

  if DataModule1.NovaConsulta('NovoPlanoContas', lComandoSQL) > 0 then
   result := IntToStr(DataModule1.getQuery('NovoPlanoContas').FieldByName('codigo').AsInteger + 1);
end;

procedure TfrmPrincipal.ConsultarVinculadorDebito(pRegistro: Integer);
var
  Teste: String;
begin
  edtCodigoDebitar.Text := fListaDebito2.Strings[fListaDebito.IndexOf(IntToStr(pRegistro))];
  Teste := edtCodigoDebitar.Text;
  edtCodigoDebitarExit(edtCodigoDebitar);
end;

procedure TfrmPrincipal.ConsultarVinculadorCredito(pRegistro: Integer);
begin
  edtCodigoCreditar.Text := fListaCredito2.Strings[fListaCredito.IndexOf(IntToStr(pRegistro))];
  edtCodigoCreditarExit(edtCodigoCreditar);
end;

function TfrmPrincipal.BuscarPlanoNaLista(pListaPlano: TStringList; Codigo: String): Integer;
var
  i: Integer;
begin
  result := -1;

  for i := 0 to pListaPlano.Count - 1 do
  begin
    if (Pos(Codigo, pListaPlano.Strings[i]) > 0) then
    begin
      result := i;
      break;
    end;
  end;
end;

function TfrmPrincipal.CarregarVinculadores(pEmpresa4: Integer): Boolean;
var
  lComandoSQL: String;
  teste: Integer;
begin
  DataModule1.MascaraPlanoContas := edtMascaraPlanoContas.Text;

  lComandoSQL := 'SELECT' + NewLine +
                 '  a.chave AS chave,' + NewLine +
                 '  a.codigo AS codigo,' + NewLine +
                 '  a.descricao,' + NewLine +
                 '  b.chave as id_debitar,' + NewLine +
                 '  b.codigo_externo AS debitar,' + NewLine +
                 '  b.codigo AS cd_debitar,' + NewLine +
                 '  b.descricao AS no_debitar,' + NewLine +
                 '  c.chave AS id_creditar,' + NewLine +
                 '  c.codigo_externo AS creditar,' + NewLine +
                 '  c.codigo AS cd_creditar,' + NewLine +
                 '  c.descricao AS no_creditar,' + NewLine +
                 '  a.historico AS historico' + NewLine +
                 'FROM' + NewLine +
                 '  vinculadores a' + NewLine +
                 '  LEFT JOIN plano_contas b ON (' + NewLine +
                 '    b.empresa = a.empresa AND' + NewLine +
                 '    b.chave = a.debitar)' + NewLine +
                 '  LEFT JOIN plano_contas c ON (' + NewLine +
                 '    c.empresa = a.empresa AND' + NewLine +
                 '    c.chave = a.creditar)' + NewLine +
                 'where' + NewLine +
                 '  a.empresa = ' + IntToStr(pEmpresa4);

  DataModule1.qVinculadores.Close;
  DataModule1.qVinculadores.SQl.Clear;
  DataModule1.qVinculadores.SQL.Add(lComandoSQL);
  DataModule1.qVinculadores.SQL.SaveToFile(ExtractFilePath(ApplicationName) + 'Vinculadores.sql');
  DataModule1.qVinculadores.Open;
  teste := DataModule1.qVinculadores.RowsAffected;
  result := not DataModule1.qVinculadores.IsEmpty;
  dbgPlano1.DataSource := DataModule1.dsVinculadores;
  CarregarVinculador;
end;

procedure TfrmPrincipal.LimparTelaVinculadores;
begin
  edtCodigoVinculador.Text := '';
  edtNomeVinculador.Text := '';
  edtCodigoDebitar.Text := '';
  edtCodigoCreditar.Text := '';
  edtClassificacaoDebitar.Text := '';
  edtClassificacaoCreditar.Text := '';
  edtNomeDebitar.Text := '';
  edtNomeCreditar.Text := '';
  edtHistorico.Text := '';

  chkLayoutsUtilizados.Items.Clear;
  CarregarLayoutsDisponiveis(true);
end;

procedure TfrmPrincipal.HabilitarVinculadores(Habilitar: Boolean);
var
  lCor: TColor;
begin
  lCor := clWhite;
  {if habilitar then
    lCor := clWhite
  else
    lCor := clBlack;}

  edtNomeVinculador.Color := lCor;
  edtNomeVinculador.Enabled := Habilitar;
  edtCodigoDebitar.Color := lCor;
  edtCodigoDebitar.Enabled := Habilitar;
  edtCodigoCreditar.Color := lCor;
  edtCodigoCreditar.Enabled := Habilitar;
  edtHistorico.Color := lCor;
  edtHistorico.Enabled := Habilitar;

  chkLayoutsDisponiveis.Enabled := Habilitar;
  chkLayoutsUtilizados.Enabled := Habilitar;
end;

procedure TfrmPrincipal.NovoVinculador;
begin
  LimparTelaVinculadores;

  fEstadoVinculador := taInclusao;

  HabilitarVinculadores(true);

  PageControl.ActivePage := pContador;
  PageControl2.ActivePage := pVinculador;
  edtCodigoVinculador.Text := ProximoCodigoVinculador;
  edtNomeVinculador.SetFocus;
end;

procedure TfrmPrincipal.EditarVinculador;
begin
  if not (DataModule1.qVinculadores.IsEmpty) then
  begin
    CarregarVinculador;
    fEstadoVinculador := taEdicao;

    HabilitarVinculadores(true);

    PageControl.ActivePage := pContador;
    PageControl2.ActivePage := pVinculador;
    edtNomeVinculador.SetFocus;
  end;
end;

procedure TfrmPrincipal.ExcluirVinculador;
var
  lComandoSQL: String;
begin
  if (fEmpresaAtual > 0) and (MensagemConfirmacao('Deseja realmente excluir esse vinculador?', 'GLC')) then
  begin
    lComandoSQL := 'DELETE FROM' + NewLine +
                   '  vinculadores' + NewLine +
                   'WHERE' + NewLine +
                   '  chave = ' + IntToStr(fVinculadorAtual);

    DataModule1.Executar(lComandoSQL);

    CarregarVinculadores(fEmpresaAtual);

    MensagemSucesso('Vinculador excluido com sucesso!', 'GLC');
  end;
end;

procedure TfrmPrincipal.CancelarVinculador;
begin
  CarregarVinculador;
  fEstadoVinculador := taNada;
  HabilitarVinculadores(false);
end;

function TfrmPrincipal.ValidarVinculador: Boolean;
begin
  result := false;

  if (chkLayoutsUtilizados.Items.Count < 1) then
  begin
    MensagemAlerta('Nâo é permitido gravar  vinculador sem leiaute definido.', 'Erro');
    chkLayoutsDisponiveis.SetFocus;
  end
  else
    result := true;
end;

function TfrmPrincipal.CarregarVinculador: Boolean;
begin
  if not (DataModule1.qVinculadores.IsEmpty) then
  begin
    fVinculadorAtual := DataModule1.qVinculadores.FieldByName('chave').AsInteger;

    edtCodigoVinculador.Text := DataModule1.qVinculadores.FieldByName('codigo').AsString;
    edtNomeVinculador.Text := DataModule1.qVinculadores.FieldByName('descricao').AsString;

    if (fListaDebito.IndexOf(DataModule1.qVinculadores.FieldByName('id_debitar').AsString) > -1) then
    begin
      edtCodigoDebitar.Text := fListaDebito2.Strings[fListaDebito.IndexOf(DataModule1.qVinculadores.FieldByName('id_debitar').AsString)];
      edtClassificacaoDebitar.Text := fListaDebito3.Strings[fListaDebito.IndexOf(DataModule1.qVinculadores.FieldByName('id_debitar').AsString)];
      edtNomeDebitar.Text := fListaDebito4.Strings[fListaDebito.IndexOf(DataModule1.qVinculadores.FieldByName('id_debitar').AsString)];
    end
    else
    begin
      edtCodigoDebitar.Text := '';
      edtClassificacaoDebitar.Text := '';
      edtNomeDebitar.Text := '';
    end;


    if (fListaCredito.IndexOf(DataModule1.qVinculadores.FieldByName('id_creditar').AsString) > -1) then
    begin
      edtCodigoCreditar.Text := fListaCredito2.Strings[fListaCredito.IndexOf(DataModule1.qVinculadores.FieldByName('id_creditar').AsString)];
      edtClassificacaoCreditar.Text := fListaCredito3.Strings[fListaCredito.IndexOf(DataModule1.qVinculadores.FieldByName('id_creditar').AsString)];
      edtNomeCreditar.Text := fListaCredito4.Strings[fListaCredito.IndexOf(DataModule1.qVinculadores.FieldByName('id_creditar').AsString)];
    end
    else
    begin
      edtCodigoCreditar.Text := '';
      edtClassificacaoCreditar.Text := '';
      edtNomeCreditar.Text := '';
    end;

    edtHistorico.Text := DataModule1.qVinculadores.FieldByName('historico').AsString;

    CarregarLayoutsDisponiveis;
    CarregarLayoutsUtilizados;
  end
  else
  begin
    LimparTelaVinculadores;
    CarregarLayoutsDisponiveis;
    CarregarLayoutsUtilizados;
  end;
end;

function TfrmPrincipal.ProximoCodigoVinculador: String;
var
  lComandoSQL: String;
begin
  lComandoSQL := 'SELECT' + NewLine +
                 '  COALESCE(MAX(codigo), 0) as codigo' + NewLine +
                 'FROM' + NewLine +
                 '  vinculadores' + NewLine +
                 'WHERE' + NewLine +
                 '  empresa = ' + IntToStr(fEmpresaAtual);

  if DataModule1.NovaConsulta('NovoVinculador', lComandoSQL) > 0 then
   result := IntToStr(DataModule1.getQuery('NovoVinculador').FieldByName('codigo').AsInteger + 1);
end;

function TfrmPrincipal.GravarVinculador: Boolean;
var
  lComandoSQL: String;
  lVinculadorAtual: Integer;
begin
  result := false;

  if (fEstadoVinculador = taInclusao) then
  begin
    result := GravarInserirVinculador;
    lVinculadorAtual := fVinculadorAtual;
  end
  else if (fEstadoVinculador = taEdicao) then
  begin
    lVinculadorAtual := fVinculadorAtual;
    result := GravarAlterarVinculador;
  end;

  if (result) then
    GravarLayoutsUtilizados;

  CarregarVinculadores(fEmpresaAtual);
  DataModule1.qVinculadores.Locate('CHAVE', IntToStr(lVinculadorAtual), []);
  CarregarVinculador;
  MontarTelaLancamento;;

  HabilitarVinculadores(false);
end;

function TfrmPrincipal.GravarInserirVinculador: Boolean;
var
  lComando: String;
  lCredito: String;
  lDebito: String;
begin
  result := false;

  try
    if (fListaDebito2.IndexOf(edtCodigoDebitar.Text) > -1) then
      lDebito := fListaDebito.Strings[fListaDebito2.IndexOf(edtCodigoDebitar.Text)]
    else
      lDebito := '0';

    if (fListaCredito2.IndexOf(edtCodigoCreditar.Text) > -1) then
      lCredito := fListaCredito.Strings[fListaCredito2.IndexOf(edtCodigoCreditar.Text)]
    else
      lCredito := '0';

    fVinculadorAtual := DataModule1.GerarChave('GEN_VINCULADORES', true);
    //fVinculadorAtual := StrToInt(edtCodigoVinculador.Text);
    lComando := 'INSERT INTO vinculadores (' + NewLine +
                'chave,' + NewLine +
                'empresa,' + NewLine +
                'codigo,' + NewLine +
                'descricao,' + NewLine +
                'debitar,' + NewLine +
                'creditar,' + NewLine +
                'historico)' + NewLine +
                'VALUES (' + NewLine +
                '' + IntToStr(fVinculadorAtual) + ',' + NewLine +
                '' + IntToStr(fEmpresaAtual) + ',' + NewLine +
                '' + edtCodigoVinculador.Text + ',' + NewLine +
                '' + QuotedStr(Trim(edtNomeVinculador.Text)) + ',' + NewLine +
                '' + lDebito + ',' + NewLine +
                '' + lCredito + ',' + NewLine +
                '' + QuotedStr(edtHistorico.Text) + ')';

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Inserir vinculador.');
  end;
end;

function TfrmPrincipal.GravarAlterarVinculador: Boolean;
var
  lComando: String;
  lCredito: String;
  lDebito: String;
begin
  result := false;

  try
    if (fListaDebito2.IndexOf(edtCodigoDebitar.Text) > -1) then
      lDebito := fListaDebito.Strings[fListaDebito2.IndexOf(edtCodigoDebitar.Text)]
    else
      lDebito := '0';

    if (fListaCredito2.IndexOf(edtCodigoCreditar.Text) > -1) then
      lCredito := fListaCredito.Strings[fListaCredito2.IndexOf(edtCodigoCreditar.Text)]
    else
      lCredito := '0';

    lComando := 'UPDATE' + NewLine +
                '  vinculadores' + NewLine +
                'SET ' + NewLine +
                '  descricao = ' + QuotedStr(Trim(edtNomeVinculador.Text)) + ',' + NewLine +
                '  debitar = ' + lDebito + ',' + NewLine +
                '  creditar = ' + lCredito + ',' + NewLine +
                '  historico = ' + QuotedStr(edtHistorico.Text) + NewLine +
                'WHERE' + NewLine +
                '  chave = ' + IntToStr(fVinculadorAtual);

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Alterar vinculador.');
  end;
end;

function TfrmPrincipal.CarregarLayoutsDisponiveis(Todos: Boolean): Boolean;
const
  lTabela = 'Vinculadores';
var
  lComandoSQL: String;
  teste: Integer;
begin
  chkLayoutsDisponiveis.Items.Clear;
  fLayoutsDisponiveis.Clear;

  lComandoSQL := 'SELECT' + NewLine +
                 '  a.chave,' + NewLine +
                 '  a.nome' + NewLine +
                 'FROM' + NewLine +
                 '  layouts a' + NewLine +
                 '  LEFT JOIN vinculadores_layout b ON (' + NewLine +
                 '    b.layout = a.chave AND' + NewLine +
                 '    b.vinculador = ' + IntToStr(fVinculadorAtual) + ')' + NewLine +
                 'WHERE' + NewLine;

  if (Todos) then
    lComandoSQL := lComandoSQL + '  a.empresa = ' + IntToStr(fEmpresaAtual) + NewLine
  else
    lComandoSQL := lComandoSQL + '  a.empresa = ' + IntToStr(fEmpresaAtual) + ' AND' + NewLine +
                                 '  b.chave IS NULL' + NewLine;

  lComandoSQL := lComandoSQL + 'ORDER BY' + NewLine +
                               '  a.nome';

  if DataModule1.NovaConsulta(lTabela, lComandoSQL) > 0 then
  begin
    DataModule1.getQuery(lTabela).First;

    while not DataModule1.getQuery(lTabela).Eof do
    begin
      chkLayoutsDisponiveis.Items.Add(DataModule1.getQuery(lTabela).FieldByName('nome').AsString);
      fLayoutsDisponiveis.Add(DataModule1.getQuery(lTabela).FieldByName('chave').AsString);

      DataModule1.getQuery(lTabela).Next;
    end;
  end;
end;

function TfrmPrincipal.CarregarLayoutsUtilizados: Boolean;
const
  lTabela = 'Vinculadores';
var
  lComandoSQL: String;
  teste: Integer;
begin
  chkLayoutsUtilizados.Items.Clear;
  fLayoutsUtilizados.Clear;

  lComandoSQL := 'SELECT' + NewLine +
                 '  a.chave,' + NewLine +
                 '  a.nome' + NewLine +
                 'FROM' + NewLine +
                 '  layouts a' + NewLine +
                 '  JOIN vinculadores_layout b ON (' + NewLine +
                 '    b.layout = a.chave)' + NewLine +
                 'WHERE' + NewLine +
                 '  a.empresa = ' + IntToStr(fEmpresaAtual) + ' AND' + NewLine +
                 '  b.vinculador = ' + IntToStr(fVinculadorAtual) + NewLine +
                 'ORDER BY' + NewLine +
                 '  a.nome';

  if DataModule1.NovaConsulta(lTabela, lComandoSQL) > 0 then
  begin
    DataModule1.getQuery(lTabela).First;

    while not DataModule1.getQuery(lTabela).Eof do
    begin
      chkLayoutsUtilizados.Items.Add(DataModule1.getQuery(lTabela).FieldByName('nome').AsString);
      fLayoutsUtilizados.Add(DataModule1.getQuery(lTabela).FieldByName('chave').AsString);

      DataModule1.getQuery(lTabela).Next;
    end;
  end;
end;

function TfrmPrincipal.GravarLayoutsUtilizados: Boolean;
var
  lComando: String;
  i: Integer;
  lCampoAtual: Integer;
begin
  result := false;

  try
    lComando := 'DELETE FROM' + NewLine +
                '  vinculadores_layout' + NewLine +
                'WHERE' + NewLine +
                '  vinculador = ' + IntToStr(fVinculadorAtual);

    DataModule1.Executar(lComando);

    for i := 0 to chkLayoutsUtilizados.Items.Count - 1 do
    begin
      lCampoAtual := DataModule1.GerarChave('GEN_VINCULADORES_LAYOUT');
      lComando := 'INSERT INTO vinculadores_layout (' + NewLine +
                  'chave,' + NewLine +
                  'empresa,' + NewLine +
                  'vinculador,' + NewLine +
                  'layout)' + NewLine +
                  'VALUES (' + NewLine +
                  '' + IntToStr(lCampoAtual) + ',' + NewLine +
                  '' + IntToStr(fEmpresaAtual) + ',' + NewLine +
                  '' + IntToStr(fVinculadorAtual) + ',' + NewLine +
                  '' + fLayoutsUtilizados.Strings[i] + ')';

      result := DataModule1.Executar(lComando);
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Inserir Layouts Utilizados.');
  end;
end;

function TfrmPrincipal.CarregarLayouts(pEmpresa4: Integer): Boolean;
var
  lComandoSQL: String;
  teste: Integer;
begin
  DataModule1.MascaraPlanoContas := edtMascaraPlanoContas.Text;

  lComandoSQL := 'SELECT' + NewLine +
                 '  a.chave,' + NewLine +
                 '  a.nome' + NewLine +
                 'FROM' + NewLine +
                 '  layouts a' + NewLine +
                 'where' + NewLine +
                 '  a.empresa = ' + IntToStr(pEmpresa4);

  DataModule1.qLayouts.Close;
  DataModule1.qLayouts.SQl.Clear;
  DataModule1.qLayouts.SQL.Add(lComandoSQL);
  DataModule1.qLayouts.SQL.SaveToFile(ExtractFilePath(ApplicationName) + 'Layouts.sql');
  DataModule1.qLayouts.Open;
  teste := DataModule1.qLayouts.RowsAffected;
  result := not DataModule1.qLayouts.IsEmpty;
  dbgLayouts.DataSource := DataModule1.dsLayouts;
  CarregarLayout;
end;

procedure TfrmPrincipal.CarregarLayout;
begin
  if not (DataModule1.qLayouts.IsEmpty) then
  begin
    fLayoutAtual := DataModule1.qLayouts.FieldByName('chave').AsInteger;

    edtNomeLayout.Text := DataModule1.qLayouts.FieldByName('nome').AsString;
    CarregarCamposLayout;

    if (chkCamposUtilizados.ItemIndex > -1) then
      CarregarListaDadosCampo(chkCamposUtilizados.Items.Strings[chkCamposUtilizados.ItemIndex]);
  end
  else
  begin
    LimparTelaLayouts;
    CarregarListaDadosCampo('none');
  end;
end;

procedure TfrmPrincipal.CarregarCamposLayout;
var
  lComandoSQL: String;
  i: Integer;
  lCampo: String;
begin
  DataModule1.CarregarCamposDisponiveis(chkCamposDisponiveis);
  chkCamposUtilizados.Items.Clear;

  lComandoSQL := 'SELECT' + NewLine +
                 '  chave,' + NewLine +
                 '  nome' + NewLine +
                 'FROM' + NewLine +
                 '  layout_campos' + NewLine +
                 'WHERE' + NewLine +
                 '  layout = ' + IntToStr(fLayoutAtual);

  if DataModule1.NovaConsulta('CamposLayout', lComandoSQL) > 0 then
  begin
    DataModule1.getQuery('CamposLayout').First;

    while not DataModule1.getQuery('CamposLayout').Eof do
    begin
      lCampo := DataModule1.getQuery('CamposLayout').FieldByName('nome').AsString;
      chkCamposUtilizados.Items.Add(DataModule1.CampoLancamentoDescricao(lCampo));

      if (chkCamposDisponiveis.Items.IndexOf(DataModule1.CampoLancamentoDescricao(lCampo)) > -1) then
        chkCamposDisponiveis.Items.Delete(chkCamposDisponiveis.Items.IndexOf(DataModule1.CampoLancamentoDescricao(lCampo)));

      DataModule1.getQuery('CamposLayout').Next;
    end;
  end;
end;

procedure TfrmPrincipal.LimparTelaLayouts;
var
  i: Integer;
begin
  edtNomeLayout.Text := '';

  DataModule1.CarregarCamposDisponiveis(chkCamposDisponiveis);
  DataModule1.CarregarCamposUtilizados(chkCamposUtilizados);
end;

procedure TfrmPrincipal.HabilitarLayout(Habilitar: Boolean);
begin
  gbNomeLayout.Enabled := Habilitar;
  edtNomeLayout.Enabled := Habilitar;
  gbTabelasDisponiveis.Enabled := Habilitar;
  gbTabelasUtilizadas.Enabled := Habilitar;
  gdbCaracteristicas.Enabled := Habilitar;
  gdbOpcao.Enabled := Habilitar;
  gbInformacoes.Enabled := Habilitar;
end;

procedure TfrmPrincipal.NovoLayout;
begin
  LimparTelaLayouts;

  fEstadoLayout := taInclusao;

  HabilitarLayout(true);

  PageControl.ActivePage := pContador;
  PageControl2.ActivePage := pLeiaute;
  fLayoutAtual := 0;
  CarregarListaDadosCampo('none');
  edtNomeLayout.SetFocus;
end;

procedure TfrmPrincipal.ExcluirLayout;
var
  lComandoSQL: String;
begin
  if ExisteLancamentos then
      MensagemAlerta('Existem lançamentos para esse leiaute. Antes de excluí-lo é necessário primeiro apagar todos os lançamentos.', 'Erro')
  else
  begin
    if (fEmpresaAtual > 0) and (MensagemConfirmacao('Deseja realmente excluir esse Leiaute?', 'GLC')) then
    begin
      lComandoSQL := 'DELETE FROM' + NewLine +
                     '  layout_campos' + NewLine +
                     'WHERE' + NewLine +
                     '  layout = ' + IntToStr(fLayoutAtual);

      DataModule1.Executar(lComandoSQL);

      lComandoSQL := 'DELETE FROM' + NewLine +
                     '  layouts' + NewLine +
                     'WHERE' + NewLine +
                     '  chave = ' + IntToStr(fLayoutAtual);

      DataModule1.Executar(lComandoSQL);

      CarregarVinculadores(fEmpresaAtual);
      CarregarLayouts(fEmpresaAtual);

      MensagemSucesso('Leiaute excluido com sucesso!', 'GLC');
    end;
  end;
end;

procedure TfrmPrincipal.CancelarLayout;
begin
  CarregarLayout;
  fEstadoLayout := taNada;
  HabilitarLayout(false);
end;

procedure TfrmPrincipal.EditarLayout;
begin
  if not (DataModule1.qLayouts.IsEmpty) then
  begin
    if ExisteLancamentos then
      MensagemAlerta('Existem lançamentos para esse leiaute. Antes de alterá-lo é necessário primeiro apagar todos os lançamentos.', 'Erro')
    else
    begin
      CarregarLayout;
      fEstadoLayout := taEdicao;

      HabilitarLayout(true);

      PageControl.ActivePage := pContador;
      PageControl2.ActivePage := pLeiaute;
      edtNomeLayout.SetFocus;
    end;
  end;
end;

function TfrmPrincipal.TemCampoSelecionado(pLista: TCheckListBox): Integer;
var
  i: Integer;
begin
  result := -1;

  for i := 0 to pLista.Items.Count - 1 do
  begin
    if pLista.Selected[i] then
    begin
      result := i;
      break;
    end;
  end;
end;

function TfrmPrincipal.GravarLayout: Boolean;
var
  lComandoSQL: String;
  lLayoutAtual: Integer;
begin
  result := false;

  if (ValidarLayout) then
  begin
    if (fEstadoLayout = taInclusao) then
    begin
      result := GravarInserirLayout;
      GravarInserirLayoutCampos;
      lLayoutAtual := fLayoutAtual;
    end
    else if (fEstadoLayout = taEdicao) then
    begin
      lLayoutAtual := fLayoutAtual;
      GravarAlterarLayoutCampos;
      result := GravarAlterarLayout;
    end;

    CarregarLayouts(fEmpresaAtual);
    DataModule1.qVinculadores.Locate('CHAVE', IntToStr(lLayoutAtual), []);
    CarregarLayout;
    CarregarLancamentoLayouts;
    CarregarVinculadores(fEmpresaAtual);

    HabilitarLayout(false);
  end;
end;

function TfrmPrincipal.ValidarLayout: Boolean;
begin
  result := true;

  if not (CampoSendoUtilizado('*Valor')) and not (CampoSendoUtilizado('*Entrada')) and not (CampoSendoUtilizado('*Saída')) then
  begin
    MensagemAlerta('Para gravar um leiaute, é necessário informar a tabela "Valor" ou as tabelas "Entrada" e "Saída".', 'Erro');
    result := false;
    exit;
  end
  else if (CampoSendoUtilizado('*Entrada')) and not (CampoSendoUtilizado('*Saída')) then
  begin
    MensagemAlerta('Ao informar a tabela "Entrada" para o leiaute, é necessário informar também a tabela "Saída".', 'Erro');
    result := false;
    exit;
  end
  else if (CampoSendoUtilizado('*Saída')) and not (CampoSendoUtilizado('*Entrada')) then
  begin
    MensagemAlerta('Ao informar a tabela "Saída" para o leiaute, é necessário informar também a tabela "Entrada".', 'Erro');
    result := false;
    exit;
  end
  else if not (CampoSendoUtilizado(' Data')) then
  begin
    MensagemAlerta('A tabela "Data" é obrigatória.', 'Erro');
    result := false;
    exit;
  end;
end;

function TfrmPrincipal.GravarInserirLayout: Boolean;
var
  lComando: String;
begin
  result := false;

  try
    fLayoutAtual := DataModule1.GerarChave('GEN_LAYOUTS');
    lComando := 'INSERT INTO layouts (' + NewLine +
                'chave,' + NewLine +
                'empresa,' + NewLine +
                'nome)' + NewLine +
                'VALUES (' + NewLine +
                '' + IntToStr(fLayoutAtual) + ',' + NewLine +
                '' + IntToStr(fEmpresaAtual) + ',' + NewLine +
                '' + QuotedStr(edtNomeLayout.Text) + ')';

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Inserir Layout.');
  end;
end;

function TfrmPrincipal.GravarInserirLayoutCampos: Boolean;
var
  lComando: String;
  i: Integer;
  lCampoAtual: Integer;
begin
  result := false;

  try
    for i := 0 to chkCamposUtilizados.Items.Count - 1 do
    begin
      if (DataModule1.CampoLancamentoLocateDescricao(chkCamposUtilizados.Items.Strings[i]) > -1) then
      begin
        lCampoAtual := DataModule1.GerarChave('GEN_LAYOUT_CAMPOS');
        lComando := 'INSERT INTO layout_campos (' + NewLine +
                    'chave,' + NewLine +
                    'empresa,' + NewLine +
                    'layout,' + NewLine +
                    'nome)' + NewLine +
                    'VALUES (' + NewLine +
                    '' + IntToStr(lCampoAtual) + ',' + NewLine +
                    '' + IntToStr(fEmpresaAtual) + ',' + NewLine +
                    '' + IntToStr(fLayoutAtual) + ',' + NewLine +
                    '' + QuotedStr(DataModule1.CampoLancamentoNome) + ')';

        result := DataModule1.Executar(lComando);

      end;
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Inserir Campos Layout.');
  end;
end;

function TfrmPrincipal.GravarAlterarLayout: Boolean;
var
  lComando: String;
begin
  result := false;

  try
    lComando := 'UPDATE layouts SET' + NewLine +
                '  nome = ' + QuotedStr(edtNomeLayout.Text) + NewLine +
                'WHERE' + NewLine +
                '  chave = ' + IntToStr(fLayoutAtual);

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Alterar Layout.');
  end;
end;

function TfrmPrincipal.GravarAlterarLayoutCampos: Boolean;
var
  lComando: String;
  i: Integer;
  lCampoAtual: Integer;
begin
  result := false;

  try
    lComando := 'DELETE FROM' + NewLine +
                '  layout_campos' + NewLine +
                'WHERE' + NewLine +
                '  layout = ' + IntToStr(fLayoutAtual);

    DataModule1.Executar(lComando);

    for i := 0 to chkCamposUtilizados.Items.Count - 1 do
    begin
      if (DataModule1.CampoLancamentoLocateDescricao(chkCamposUtilizados.Items.Strings[i]) > -1) then
      begin
        lCampoAtual := DataModule1.GerarChave('GEN_LAYOUT_CAMPOS');
        lComando := 'INSERT INTO layout_campos (' + NewLine +
                    'chave,' + NewLine +
                    'empresa,' + NewLine +
                    'layout,' + NewLine +
                    'nome)' + NewLine +
                    'VALUES (' + NewLine +
                    '' + IntToStr(lCampoAtual) + ',' + NewLine +
                    '' + IntToStr(fEmpresaAtual) + ',' + NewLine +
                    '' + IntToStr(fLayoutAtual) + ',' + NewLine +
                    '' + QuotedStr(DataModule1.CampoLancamentoNome) + ')';

        result := DataModule1.Executar(lComando);
      end;
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Inserir Campos Layout.');
  end;
end;

procedure TfrmPrincipal.GravarInserirCampo(pNomeCampo: String);
var
  lComando: String;
  i: Integer;
  lCampoAtual: Integer;
begin
  try
    lComando := 'DELETE FROM' + NewLine +
                '  layout_campos_dados' + NewLine +
                'WHERE' + NewLine +
                 '  layout = ' + IntToStr(fLayoutAtual) + ' AND' + NewLine +
                 '  campo = ' + QuotedStr(pNomeCampo);

    DataModule1.Executar(lComando);

    lCampoAtual := DataModule1.GerarChave('GEN_LAYOUT_CAMPOS_DADOS');
    lComando := 'INSERT INTO layout_campos_dados (' + NewLine +
                'chave,' + NewLine +
                'empresa,' + NewLine +
                'layout,' + NewLine +
                'campo,' + NewLine +
                'dado)' + NewLine +
                'VALUES (' + NewLine +
                '' + IntToStr(lCampoAtual) + ',' + NewLine +
                '' + IntToStr(fEmpresaAtual) + ',' + NewLine +
                '' + IntToStr(fLayoutAtual) + ',' + NewLine +
                '' + QuotedStr(Copy(chkCamposUtilizados.Items.Strings[chkCamposUtilizados.ItemIndex], 1, 20)) + ',' + NewLine +
                '' + QuotedStr(Copy(pNomeCampo, 1, 100)) + ')';

    DataModule1.Executar(lComando);

    CarregarListaDadosCampo(chkCamposUtilizados.Items.Strings[chkCamposUtilizados.ItemIndex]);
  except on e:exception do
    MensagemErro(e.Message, 'Inserir Dados Campos Layout.');
  end;
end;

procedure TfrmPrincipal.MostrarDadosCampo(pDescricao: String; HabilitarInsercao: Boolean);
begin
  if (DataModule1.CampoLancamentoLocateDescricao(pDescricao) > -1) then
  begin
    edtTipoCampo.Text := DataModule1.CampoLancamentoTipo;
    edtFormatoCampo.Text := DataModule1.CampoLancamentoFormato;
    edtTamanhoCampo.Text := IntToStr(DataModule1.CampoLancamentoTamanho);
    if DataModule1.CampoLancamentoDados then
    begin
      btnAdicionarDadosCampo.Enabled := DataModule1.CampoLancamentoDados;
      btnExcluirDadosCampo.Enabled := DataModule1.CampoLancamentoDados;
    end
    else
    begin
      btnAdicionarDadosCampo.Enabled := false;
      btnExcluirDadosCampo.Enabled := false;
    end;
  end
  else
  begin
    edtTipoCampo.Text := '';
    edtFormatoCampo.Text := '';
    edtTamanhoCampo.Text := '';
    btnAdicionarDadosCampo.Enabled := false;
    btnExcluirDadosCampo.Enabled := false;
  end;
end;

procedure TfrmPrincipal.CarregarListaDadosCampo(pNomeCampo: String);
const
  lTabela = 'DadosCampos';
var
  lComandoSQL: String;
  teste: Integer;
begin
  dbgDadosCampos.DataSource := DataModule1.getDataSource(lTabela);

  lComandoSQL := 'SELECT' + NewLine +
                 '  dado' + NewLine +
                 'FROM' + NewLine +
                 '  layout_campos_dados' + NewLine +
                 'WHERE' + NewLine +
                 '  layout = ' + IntToStr(fLayoutAtual) + ' AND' + NewLine +
                 '  campo = ' + QuotedStr(pNomeCampo);

  DataModule1.NovaConsulta(lTabela, lComandoSQL);
  dbgDadosCampos.DataSource := DataModule1.getDataSource(lTabela);
end;

function TfrmPrincipal.PodeAdicionarCampo(i: Integer): Boolean;
begin
  if (chkCamposDisponiveis.Items.Strings[i] = 'Entrada') and (CampoSendoUtilizado('Valor')) then
    result := false
  else if (chkCamposDisponiveis.Items.Strings[i] = 'Saída') and (CampoSendoUtilizado('Valor')) then
    result := false
  else if (chkCamposDisponiveis.Items.Strings[i] = 'Valor') and (CampoSendoUtilizado('Entrada') or CampoSendoUtilizado('Saída')) then
    result := false
  else
    result := true;
end;

function TfrmPrincipal.CampoSendoUtilizado(pNomeCampo: String): Boolean;
var
  i: Integer;
  lTeste: String;
begin
  result := false;

  for i := 0 to chkCamposUtilizados.Items.Count - 1 do
  begin
    lTeste := chkCamposUtilizados.Items.Strings[i];
    if (lTeste = pNomeCampo) then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TfrmPrincipal.CarregarLancamentoLayouts;
const
  lTabela = 'LancamentoLayouts';
var
  lComandoSQL: String;
begin
  cmbLancamentoLayout.Items.Clear;
  fLancamentoLayouts.Clear;

  lComandoSQL := 'SELECT' + NewLine +
                 '  chave,' + NewLine +
                 '  nome' + NewLine +
                 'FROM' + NewLine +
                 '  layouts' + NewLine +
                 'WHERE' + NewLine +
                 '  empresa = ' + IntToStr(fEmpresaAtual) + NewLine +
                 'ORDER BY' + NewLine +
                 '  nome';

  if DataModule1.NovaConsulta(lTabela, lComandoSQL) > 0 then
  begin
    DataModule1.getQuery(lTabela).First;

    while not (DataModule1.getQuery(lTabela).EOF) do
    begin
      cmbLancamentoLayout.Items.Add(DataModule1.getQuery(lTabela).FieldByName('nome').AsString);
      fLancamentoLayouts.Add(DataModule1.getQuery(lTabela).FieldByName('chave').AsString);

      DataModule1.getQuery(lTabela).Next;
    end;

    cmbLancamentoLayout.ItemIndex := 0;
    fLayoutAtual := StrToIntDef(fLancamentoLayouts.Strings[0], 0);
    cmbLancamentoLayoutChange(cmbLancamentoLayout);
  end
  else
  begin
    fLancamentoLayoutAtual := 0;
    MontarTelaLancamento;
  end;
end;

procedure TfrmPrincipal.MontarTelaLancamento;
const
  lTabela = 'MontarLancamento';
var
  lComandoSQL: String;
  i: Integer;
begin
  fLeft := 16;
  fTop := 66;
  fLength := 1050;

  lComandoSQL := 'SELECT' + NewLine +
                 '  (1) as indice,' + NewLine +
                 '  chave,' + NewLine +
                 '  nome' + NewLine +
                 'FROM' + NewLine +
                 '  layout_campos' + NewLine +
                 'WHERE' + NewLine +
                 '  layout = ' + IntToStr(fLancamentoLayoutAtual) + NewLine +
                 '  AND empresa = ' + IntToStr(fEmpresaAtual) + NewLine +
                 '  AND nome = ' + QuotedStr('data') + NewLine +
                 'UNION' + NewLine +
                 'SELECT' + NewLine +
                 '  (2) as indice,' + NewLine +
                 '  chave,' + NewLine +
                 '  nome' + NewLine +
                 'FROM' + NewLine +
                 '  layout_campos' + NewLine +
                 'WHERE' + NewLine +
                 '  layout = ' + IntToStr(fLancamentoLayoutAtual) + NewLine +
                 '  AND empresa = ' + IntToStr(fEmpresaAtual) + NewLine +
                 '  AND nome <> ' + QuotedStr('data') + NewLine +
                 '  AND nome <> ' + QuotedStr('vinculador') + NewLine +
                 'UNION' + NewLine +
                 'SELECT' + NewLine +
                 '  (3) as indice,' + NewLine +
                 '  chave,' + NewLine +
                 '  nome' + NewLine +
                 'FROM' + NewLine +
                 '  layout_campos' + NewLine +
                 'WHERE' + NewLine +
                 '  layout = ' + IntToStr(fLancamentoLayoutAtual) + NewLine +
                 '  AND empresa = ' + IntToStr(fEmpresaAtual) + NewLine +
                 '  AND nome = ' + QuotedStr('vinculador') + NewLine +
                 'ORDER BY 1, 2';

  if (DataModule1.NovaConsulta(lTabela, lComandoSQL) > 0) then
  begin
    pClientes.TabVisible := not DataModule1.qPlanoContas.IsEmpty;

    if not assigned(fListaCampos) then
    begin
      fListaCampos :=  TList.Create;
      fGarbageCollector.Add(fListaCampos);
    end;

    if not Assigned(fListaCamposNome) then
    begin
      fListaCamposNome := TStringList.Create;
      fGarbageCollector.Add(fListaCamposNome);
    end;

    fListaCamposNome.Clear;
    fCampoEntrada := nil;
    fCampoSaida := nil;

    while fListaCampos.Count > 0 do
    begin
      TObject(fListaCampos.Items[0]).Free;
      fListaCampos.Delete(0);
    end;

    dbgLancamento.Columns.Clear;

    DataModule1.getQuery(lTabela).First;

    while not DataModule1.getQuery(lTabela).EOF do
    begin
      CriarCampoLancamento(DataModule1.getQuery(lTabela).FieldByName('nome').AsString);

      DataModule1.getQuery(lTabela).Next;
    end;

    ConsultarLancamentos;
    NovoLancamento;
  end
  else
  begin
    if not assigned(fListaCampos) then
    begin
      fListaCampos :=  TList.Create;
      fGarbageCollector.Add(fListaCampos);
    end;

    if not Assigned(fListaCamposNome) then
    begin
      fListaCamposNome := TStringList.Create;
      fGarbageCollector.Add(fListaCamposNome);
    end;

    fListaCamposNome.Clear;

    while fListaCampos.Count > 0 do
    begin
      TObject(fListaCampos.Items[0]).Free;
      fListaCampos.Delete(0);
    end;

    dbgLancamento.Columns.Clear;

    ConsultarLancamentos;

    SetButtonField(fLeft, fTop, fLength);
    pClientes.TabVisible := false;
  end;
end;

procedure TfrmPrincipal.CriarCampoLancamento(pNomeCampo: String);
var
  lNovoCampo: TFieldDef;
  lColumn: TColumn;
  lFormat: String;
begin
  DataModule1.CampoLancamentoLocate(pNomeCampo);
  fListaCamposNome.Add(pNomeCampo);

  lColumn := dbgLancamento.Columns.Add;

  if (DataModule1.CampoLancamentoNome = 'vinculador') then
    lColumn.FieldName := 'no_vinculador'
  else if (DataModule1.CampoLancamentoDados) then
    lColumn.FieldName := DataModule1.CampoLancamentoNome
  else
    lColumn.FieldName := DataModule1.CampoLancamentoNome;

  lFormat := DataModule1.CampoLancamentoDisPlayFormat;
  lColumn.DisplayFormat := lFormat;

  if DataModule1.CampoLancamentoType = ftString then
    lColumn.Width := 224
  else if (DataModule1.CampoLancamentoNome = 'vinculador') then
    lColumn.Width := 164;

  lColumn.Title.Caption := Copy(DataModule1.CampoLancamentoDescricao, 2, 100);

  if (DataModule1.CampoLancamentoNome = 'vinculador') then
    CreateVinculadorField(fLeft, fTop, fLength)
  else if (DataModule1.CampoLancamentoDados) then
    CreateComboField(fLeft, fTop, fLength)
  else if (DataModule1.CampoLancamentoType = ftString) then
    CreateStringField(fLeft, fTop, fLength)
  else if (DataModule1.CampoLancamentoType = ftFloat) then
    CreateDecimalField(fLeft, fTop, fLength)
  else if (DataModule1.CampoLancamentoType = ftDateTime) then
    CreateDateField(fLeft, fTop, fLength);

  SetButtonField(fLeft, fTop, fLength);
end;

procedure TfrmPrincipal.ConsultarLancamentos;
var
  lComandoSQL: String;
begin
  lComandoSQL := 'SELECT' + NewLine +
                 '  a.*,' + NewLine +
                 '  b.descricao AS no_vinculador' + NewLine +
                 //'  c.dado AS no_fornecedor,' + NewLine +
                 //'  d.dado AS no_pago_por,' + NewLine +
                 //'  e.dado AS historico,' + NewLine +
                 //'  f.dado AS cliente' + NewLine +
                 'FROM' + NewLine +
                 '  lancamentos a' + NewLine +
                 '  LEFT JOIN vinculadores b ON (' + NewLine +
                 '    a.vinculador = b.chave)' + NewLine +
                 {'  LEFT JOIN layout_campos_dados c ON (' + NewLine +
                 '    c.layout = a.layout' + NewLine +
                 '    AND c.chave = a.fornecedor)' + NewLine +
                 '  LEFT JOIN layout_campos_dados d ON (' + NewLine +
                 '    d.layout = a.layout' + NewLine +
                 '    AND c.chave = a.pago_por)' + NewLine +
                 '  LEFT JOIN layout_campos_dados e ON (' + NewLine +
                 '    e.layout = a.layout' + NewLine +
                 '    AND c.chave = a.historico)' + NewLine +
                 '  LEFT JOIN layout_campos_dados f ON (' + NewLine +
                 '    f.layout = a.layout' + NewLine +
                 '    AND c.chave = a.cliente)' + NewLine }
                 'WHERE' + NewLine +
                 '  a.empresa = ' + IntToStr(fEmpresaAtual) + NewLine +
                 '  AND a.layout = ' + IntToStr(fLancamentoLayoutAtual);

  DataModule1.qLancamentos.Close;
  DataModule1.qLancamentos.SQL.Clear;
  DataModule1.qLancamentos.SQL.Add(lComandoSQL);
  DataModule1.qLancamentos.SQL.SaveToFile(ExtractFilePath(ApplicationName) + 'ConsultarLancamentos.sql');
  DataModule1.qLancamentos.Open;

  TotalizarValores;
  dbgLancamento.DataSource := DataModule1.dsLancamentos;
end;

function TfrmPrincipal.ExisteLancamentos: Boolean;
var
  lComandoSQL: String;
begin
  result := false;
  lComandoSQL := 'SELECT' + NewLine +
                 '  a.chave' + NewLine +
                 'FROM' + NewLine +
                 '  lancamentos a' + NewLine +
                 'WHERE' + NewLine +
                 '  a.empresa = ' + IntToStr(fEmpresaAtual) + NewLine +
                 '  AND a.layout = ' + IntToStr(fLayoutAtual);

  result := DataModule1.Consultar(lComandoSQL) > 0;
end;

procedure TfrmPrincipal.CarregarListaDadosCampoLancamento(var pCombo: TComboBox; pNomeCampo: String);
const
  lTabela = 'DadosCampos';
var
  lComandoSQL: String;
  teste: Integer;
begin
  dbgDadosCampos.DataSource := DataModule1.getDataSource(lTabela);

  lComandoSQL := 'SELECT' + NewLine +
                 '  dado' + NewLine +
                 'FROM' + NewLine +
                 '  layout_campos_dados' + NewLine +
                 'WHERE' + NewLine +
                 '  layout = ' + IntToStr(fLancamentoLayoutAtual) + ' AND' + NewLine +
                 '  campo = ' + QuotedStr(pNomeCampo);

  DataModule1.NovaConsulta(lTabela, lComandoSQL);

  DataModule1.getQuery(lTabela).First;
  while not DataModule1.getQuery(lTabela).EOF do
  begin
    pCombo.Items.Add(DataModule1.getQuery(lTabela).FieldByName('dado').AsString);

    DataModule1.getQuery(lTabela).Next;
  end;
end;

procedure TfrmPrincipal.CarregarListaVinculadorCampoLancamento(var pCombo: TComboBox);
const
  lTabela2 = 'DadosCampos2';
var
  lComandoSQL: String;
  teste: Integer;
begin
  if not Assigned(fVinculadoresLayout) then
  begin
    fVinculadoresLayout := TStringList.Create;
    fGarbageCollector.Add(fVinculadoresLayout);
  end;

  lComandoSQL := 'SELECT' + NewLine +
                 '  a.vinculador,' + NewLine +
                 '  b.descricao' + NewLine +
                 'FROM' + NewLine +
                 '  vinculadores_layout a' + NewLine +
                 '  JOIN vinculadores b ON (' + NewLine +
                 '    b.chave = a.vinculador)' + NewLine +
                 'WHERE' + NewLine +
                 '  a.layout = ' + IntToStr(fLancamentoLayoutAtual);

  DataModule1.NovaConsulta(lTabela2, lComandoSQL);

  DataModule1.getQuery(lTabela2).First;
  while not DataModule1.getQuery(lTabela2).EOF do
  begin
    fVinculadoresLayout.Add(DataModule1.getQuery(lTabela2).FieldByName('vinculador').AsString);
    pCombo.Items.Add(DataModule1.getQuery(lTabela2).FieldByName('descricao').AsString);

    DataModule1.getQuery(lTabela2).Next;
  end;
end;

procedure TfrmPrincipal.NovoLancamento;
var
  i: Integer;
  lNome: String;
  lField: TComponent;
  lFirstField: TWinControl;
begin
  lFirstField := nil;

  for i := 0  to fListaCamposNome.Count - 1 do
  begin
    if DataModule1.CampoLancamentoLocate(fListaCamposNome.Strings[i]) > -1 then
    begin
      lNome := 'edtLanc_' + DataModule1.CampoLancamentoNome;
      lField := FindComponent(lNome);

      if not Assigned(lFirstField) then
        lFirstField := TWinControl(lField);

      if Assigned(lField) then
      begin
        if (DataModule1.CampoLancamentoNome = 'vinculador') then
        begin
          TComboBox(lField).ItemIndex := -1;
          TComboBox(lField).Text := '';
        end
        else if (DataModule1.CampoLancamentoDados) then
        begin
          TComboBox(lField).ItemIndex := -1;
          TComboBox(lField).Text := '';
        end
        else if (DataModule1.CampoLancamentoType = ftString) then
          TEdit(lField).Text := ''
        else if (DataModule1.CampoLancamentoType = ftFloat) then
          TEdit(lField).Text := '';
      end;
    end;
  end;

  if (pLancamentos.Visible) and (pLancamentos.CanFocus) then
    lFirstField.SetFocus;
  fEstadoLancamento := taInclusao;
end;

procedure TfrmPrincipal.EditarLancamento;
var
  i: Integer;
  lFirstField: TWinControl;
begin
  lFirstField := nil;

  if not (DataModule1.qLancamentos.IsEmpty) then
  begin

    for i := 0  to fListaCamposNome.Count - 1 do
    begin
      if not Assigned(lFirstField) then
        lFirstField := TWinControl(FindComponent('edtLanc_' + fListaCamposNome.Strings[i]));

      setValue(fListaCamposNome.Strings[i]);
    end;

    fLancamentoAtual := DataModule1.qLancamentos.FieldByName('chave').AsInteger;
    fEstadoLancamento := taEdicao;
    lFirstField.SetFocus;
  end;
end;

procedure TfrmPrincipal.ExcluirLancamento;
var
  lComandoSQL: String;
begin
  if not (DataModule1.qLancamentos.IsEmpty) then
  begin
    lComandoSQL := 'DELETE FROM lancamentos' + NewLine;
    lComandoSQL := lComandoSQL + 'WHERE' + NewLine +
                                 '  chave = ' + DataModule1.qLancamentos.FieldByName('chave').AsString;

    DataModule1.Executar(lComandoSQL);
  end;

  ConsultarLancamentos;
end;

procedure TfrmPrincipal.CreateStringField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
var
  lWidth: Integer;
  lLabel: TLabel;
  lEdit: TEdit;
begin
  lWidth := 24 + (DataModule1.CampoLancamentoTamanho * 7);
  if ((pLeft + lWidth + 12) > pLength) then
  begin
    pTop := pTop + 48;
    pLeft := 16;
  end;

  lLabel := TLabel.Create(frmPrincipal);
  lLabel.Parent := gbLancamentos;
  lLabel.Left := pLeft;
  lLabel.Top := pTop - 19;
  lLabel.Caption := Copy(DataModule1.CampoLancamentoDescricao, 2, 100);
  lLabel.Name := 'lblLanc_' + DataModule1.CampoLancamentoNome;
  lLabel.Visible := true;
  fListaCampos.Add(lLabel);

  lEdit := TEdit.Create(frmPrincipal);
  lEdit.Parent := gbLancamentos;
  lEdit.Left := pLeft;
  lEdit.Top := pTop;
  lEdit.Width := lWidth;
  lEdit.CharCase := ecUppercase;
  lEdit.MaxLength := DataModule1.CampoLancamentoTamanho;
  lEdit.Name := 'edtLanc_' + DataModule1.CampoLancamentoNome;
  lEdit.Visible := true;
  lEdit.Text := '';
  fListaCampos.Add(lEdit);

  pLeft := pLeft + lWidth + 12;

  btnGravarLancamento.TabOrder := lEdit.TabOrder + 1;
  btnGravarLancamento.Visible := true;
  btnGravarLancamento.Top  := pTop;
  btnGravarLancamento.Left := pLeft;
end;

procedure TfrmPrincipal.CreateDecimalField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
var
  lWidth: Integer;
  lLabel: TLabel;
  lEdit: TEdit;
begin
  lWidth := 88;
  if ((pLeft + lWidth + 12) > pLength) then
  begin
    pTop := pTop + 48;
    pLeft := 16;
  end;

  lLabel := TLabel.Create(frmPrincipal);
  lLabel.Parent := gbLancamentos;
  lLabel.Left := pLeft;
  lLabel.Top := pTop - 19;
  lLabel.Caption := Copy(DataModule1.CampoLancamentoDescricao, 2, 100);
  lLabel.Name := 'lblLanc_' + DataModule1.CampoLancamentoNome;
  lLabel.Visible := true;
  fListaCampos.Add(lLabel);

  lEdit := TEdit.Create(frmPrincipal);
  lEdit.Parent := gbLancamentos;
  lEdit.Left := pLeft;
  lEdit.Top := pTop;
  lEdit.Width := lWidth;
  lEdit.MaxLength := DataModule1.CampoLancamentoTamanho;
  lEdit.Name := 'edtLanc_' + DataModule1.CampoLancamentoNome;
  lEdit.Visible := true;
  lEdit.Text := '';
  lEdit.OnKeyPress := @DecimalValidator;
  lEdit.OnExit := @DecimalExit;
  fListaCampos.Add(lEdit);

  if (DataModule1.CampoLancamentoNome = 'entrada') then
    fCampoEntrada := lEdit
  else if (DataModule1.CampoLancamentoNome = 'saida') then
    fCampoSaida := lEdit;

  pLeft := pLeft + lWidth + 10;

  btnGravarLancamento.TabOrder := lEdit.TabOrder + 1;
  btnGravarLancamento.Visible := true;
  btnGravarLancamento.Top  := pTop;
  btnGravarLancamento.Left := pLeft;
end;

procedure TfrmPrincipal.CreateDateField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
var
  lWidth: Integer;
  lLabel: TLabel;
  lDate: TDateEdit;
begin
  lWidth := 84;
  if ((pLeft + lWidth + 12) > pLength) then
  begin
    pTop := pTop + 48;
    pLeft := 16;
  end;

  lLabel := TLabel.Create(frmPrincipal);
  lLabel.Parent := gbLancamentos;
  lLabel.Left := pLeft;
  lLabel.Top := pTop - 19;
  lLabel.Caption := Copy(DataModule1.CampoLancamentoDescricao, 2, 100);
  lLabel.Name := 'lblLanc_' + DataModule1.CampoLancamentoNome;
  lLabel.Visible := true;
  fListaCampos.Add(lLabel);

  lDate := TDateEdit.Create(frmPrincipal);
  lDate.Parent := gbLancamentos;
  lDate.Left := pLeft;
  lDate.Top := pTop;
  lDate.Width := lWidth;
  lDate.Name := 'edtLanc_' + DataModule1.CampoLancamentoNome;
  lDate.Visible := true;
  lDate.Date := Now;
  lDate.OnKeyPress := @DateValidator;
  fListaCampos.Add(lDate);

  pLeft := pLeft + lWidth + 33;

  btnGravarLancamento.TabOrder :=  lDate.TabOrder + 1;
  btnGravarLancamento.Visible := true;
  btnGravarLancamento.Top  := pTop;
  btnGravarLancamento.Left := pLeft;
end;

procedure TfrmPrincipal.CreateVinculadorField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
var
  lCombo: TcomboBox;
  lLabel:TLabel;
  lWidth: Integer;
begin
  lWidth := 208;
  if ((pLeft + lWidth + 12) > pLength) then
  begin
    pTop := pTop + 48;
    pLeft := 16;
  end;

  lLabel := TLabel.Create(frmPrincipal);
  lLabel.Parent := gbLancamentos;
  lLabel.Left := pLeft;
  lLabel.Top := pTop - 19;
  lLabel.Caption := Copy(DataModule1.CampoLancamentoDescricao, 2, 100);
  lLabel.Name := 'lblLanc_' + DataModule1.CampoLancamentoNome;
  lLabel.Visible := true;
  fListaCampos.Add(lLabel);

  lCombo := TComboBox.Create(frmPrincipal);
  lCombo.Parent := gbLancamentos;
  lCombo.AutoComplete := true;
  lCombo.AutoCompleteText := [cbactEnabled];
  lCombo.OnKeyPress := @ComboValidator;
  lCombo.Left := pLeft;
  lCombo.Top := pTop;
  lCombo.Width := lWidth;
  lCombo.CharCase := ecUppercase;
  lCombo.Name := 'edtLanc_' + DataModule1.CampoLancamentoNome;
  lCombo.Text := '';
  lCombo.Visible := true;
  CarregarListaVinculadorCampoLancamento(lCombo);
  fListaCampos.Add(lCombo);

  pLeft := pLeft + lWidth + 12;
  btnGravarLancamento.TabOrder := lCombo.TabOrder + 1;
  btnGravarLancamento.Visible := true;
  btnGravarLancamento.Top  := pTop;
  btnGravarLancamento.Left := pLeft;
end;

procedure TfrmPrincipal.CreateComboField(var pLeft: Integer; var pTop: Integer;
  pLength: Integer);
var
  lCombo: TcomboBox;
  lLabel: TLabel;
  lWidth: Integer;
begin
  lWidth := 208;
  if ((pLeft + lWidth + 12) > pLength) then
  begin
    pTop := pTop + 48;
    pLeft := 16;
  end;

  lLabel := TLabel.Create(frmPrincipal);
  lLabel.Parent := gbLancamentos;
  lLabel.Left := pLeft;
  lLabel.Top := pTop - 19;
  lLabel.Caption := Copy(DataModule1.CampoLancamentoDescricao, 2, 100);
  lLabel.Name := 'lblLanc_' + DataModule1.CampoLancamentoNome;
  lLabel.Visible := true;
  fListaCampos.Add(lLabel);

  lCombo := TComboBox.Create(frmPrincipal);
  lCombo.Parent := gbLancamentos;
  lCombo.AutoComplete := true;
  lCombo.AutoCompleteText := [cbactEnabled];
  lCombo.Style := csSimple;
  lCombo.Left := pLeft;
  lCombo.Top := pTop;
  lCombo.Width := lWidth;
  lCombo.CharCase := ecUppercase;
  lCombo.Name := 'edtLanc_' + DataModule1.CampoLancamentoNome;
  lCombo.Text := '';
  lCombo.Visible := true;
  CarregarListaDadosCampoLancamento(lCombo, DataModule1.CampoLancamentoDescricao);
  lCombo.OnKeyPress := @ComboValidator;
  fListaCampos.Add(lCombo);

  pLeft := pLeft + lWidth + 12;
  btnGravarLancamento.TabOrder := lcombo.TabOrder + 1;
  btnGravarLancamento.Visible := true;
  btnGravarLancamento.Top  := pTop;
  btnGravarLancamento.Left := pLeft;
end;

procedure TfrmPrincipal.SetButtonField(var pLeft: Integer; var pTop: Integer;
  pLength: Integer);
var
  lWidth: Integer;
  lTop: Integer;
  lLeft: Integer;
begin
  lWidth := 208;
  if ((pLeft + lWidth + 12) > pLength) then
  begin
    lTop := pTop + 48;
    lLeft := 16;
  end
  else
  begin
    lTop := pTop;
    lLeft := pLeft;
  end;

  btnGravarLancamento.Top  := lTop;
  btnGravarLancamento.Left := lLeft;
end;

procedure TfrmPrincipal.GravarLancamento;
begin
  if ValidarLancamento then
  begin
    if (fEstadoLancamento = taInclusao) then
      GravarLancamentoInserir
    else if (fEstadoLancamento = taEdicao) then
      GravarLancamentoAlterar;

    ConsultarLancamentos;
    NovoLancamento;
  end;
end;

procedure TfrmPrincipal.GravarLancamentoInserir;
var
  lComandoSQL: String;
  i: Integer;
begin
  fLancamentoAtual := DataModule1.GerarChave('GEN_LANCAMENTOS');

  lComandoSQL := 'INSERT INTO lancamentos (' + NewLine +
                 '  chave,' + NewLine +
                 '  empresa,' + NewLine +
                 '  layout,' + NewLine;

  for i := 0 to fListaCamposNome.Count - 1 do
    lComandoSQL := lComandoSQL + '  ' + fListaCamposNome.Strings[i] + ',' + NewLine;

  lComandoSQL := lComandoSQL + '  data_lanc)' + NewLine +
                               'VALUES (' + NewLine +
                               '  ' + IntToStr(fLancamentoAtual) + ',' + NewLine +
                               '  ' + IntToStr(fEmpresaAtual) + ',' + NewLine +
                               '  ' + IntToStr(fLancamentoLayoutAtual) + ',' + NewLine;

  for i := 0 to fListaCamposNome.Count - 1 do
    lComandoSQL := lComandoSQL + '  ' + getValue(fListaCamposNome.Strings[i]) + ',' + NewLine;

  lComandoSQL := lComandoSQL + '  ' + QuotedStr(FormatDateTime('dd.mm.yyyy', Now)) + ')';

  DataModule1.Executar(lComandoSQL);
end;

procedure TfrmPrincipal.GravarLancamentoAlterar;
var
  lComandoSQL: String;
  i: Integer;
begin
  lComandoSQL := 'UPDATE lancamentos SET' + NewLine;

  for i := 0 to fListaCamposNome.Count - 1 do
    lComandoSQL := lComandoSQL + '  ' + fListaCamposNome.Strings[i] + ' = ' + getValue(fListaCamposNome.Strings[i]) + ',' + NewLine;

  lComandoSQL := lComandoSQL + '  data_edit = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', Now)) + NewLine +
                               'WHERE' + NewLine +
                               '  chave = ' + IntToStr(fLancamentoAtual);

  DataModule1.Executar(lComandoSQL);
end;

function TfrmPrincipal.ValidarLancamento: Boolean;
begin
  result := true;

  if Assigned(FindComponent('edtLanc_vinculador')) and (TComboBox(FindComponent('edtLanc_vinculador')).ItemIndex < 0) then
  begin
    MensagemAlerta('É obrigatório informar um vinculador.', 'Erro');
    result := false;
  end;
end;

function TfrmPrincipal.getValue(pNomeCampo: String): String;
begin
  DataModule1.CampoLancamentoLocate(pNomeCampo);

  if (DataModule1.CampoLancamentoNome = 'vinculador') then
    result := fVinculadoresLayout.Strings[TComboBox(FindComponent('edtLanc_' + pNomeCampo)).ItemIndex]
  else if (DataModule1.CampoLancamentoDados) then
    result := QuotedStr(TComboBox(FindComponent('edtLanc_' + pNomeCampo)).Text)
  else if (DataModule1.CampoLancamentoType = ftString) then
    result := QuotedStr(TEdit(FindComponent('edtLanc_' + pNomeCampo)).Text)
  else if (DataModule1.CampoLancamentoType = ftFloat) then
  begin
    if Vazio(TEdit(FindComponent('edtLanc_' + pNomeCampo)).Text) then
      result := '0'
    else
      result := QuotedStr(StringReplace(TEdit(FindComponent('edtLanc_' + pNomeCampo)).Text, DecimalSeparator, '.', [rfReplaceAll]))
  end
  else if (DataModule1.CampoLancamentoType = ftDateTime) then
    result := QuotedStr(FormatDateTime('dd.mm.yyyy', TDateEdit(FindComponent('edtLanc_' + pNomeCampo)).Date));
end;

procedure TfrmPrincipal.setValue(pNomeCampo: String);
var
  lNome: String;
  lField: TComponent;
begin
  DataModule1.CampoLancamentoLocate(pNomeCampo);
  lNome := 'edtLanc_' + DataModule1.CampoLancamentoNome;
  lField := FindComponent(lNome);

  if Assigned(lField) then
  begin
    if (DataModule1.CampoLancamentoNome = 'vinculador') then
    begin
      TComboBox(lField).ItemIndex := fVinculadoresLayout.IndexOf(DataModule1.qLancamentos.FieldByName(DataModule1.CampoLancamentoNome).AsString);
    end
    else if (DataModule1.CampoLancamentoDados) then
    begin
      TComboBox(lField).ItemIndex := TComboBox(lField).Items.IndexOf(DataModule1.qLancamentos.FieldByName(DataModule1.CampoLancamentoNome).AsString);
      TComboBox(lField).Text := DataModule1.qLancamentos.FieldByName(DataModule1.CampoLancamentoNome).AsString;
    end
    else if (DataModule1.CampoLancamentoType = ftDateTime) then
      TDateEdit(lField).Date := DataModule1.qLancamentos.FieldByName(DataModule1.CampoLancamentoNome).AsDateTime
    else if (DataModule1.CampoLancamentoType = ftFloat) then
      TEdit(lField).Text := FormatFloat('####.##', DataModule1.qLancamentos.FieldByName(DataModule1.CampoLancamentoNome).AsFloat)
    else
      TEdit(lField).Text := DataModule1.qLancamentos.FieldByName(DataModule1.CampoLancamentoNome).AsString  ;
  end;
end;

function TfrmPrincipal.ExportarDominio(Empresa: Integer; pNomeArquivo: String;
  pBarraProgresso: TProgressBar): Boolean;
const
  lNomeConsulta = 'Integracao';
var
  i: Integer;
  iSequencial: Integer;
  lArquivo: TStringList;
  lLinha: String;
  pComandoSQL: String;
  lCodigoEmpresa: String;
begin
  result := false;
  lArquivo := TStringList.Create;

  try
    try
      pComandoSQL := 'SELECT' + NewLine +
                     '  codigo,' + NewLine +
                     '  nome,' + NewLine +
                     '  cnpj,' + NewLine +
                     '  (SELECT MIN(data_lanc) FROM lancamentos WHERE empresa = ' + IntToStr(fEmpresaAtual) + ') AS data_inicial,' + NewLine +
                     '  (SELECT MAX(data_lanc) FROM lancamentos WHERE empresa = ' + IntToStr(fEmpresaAtual) + ') AS data_final' + NewLine +
                     'FROM' + NewLine +
                     '  empresa' + NewLine +
                     'WHERE' + NewLine +
                     '  chave = ' + IntToStr(fEmpresaAtual) + NewLine;

      if (DataModule1.NovaConsulta(lNomeConsulta, pComandoSQL) > 0) then
      begin
        lCodigoEmpresa := AlignRight(DataModule1.getQuery(lNomeConsulta).FieldByName('codigo').AsString, 7, '0');

        lLinha := '01' +
                  lCodigoEmpresa +
                  AlignRight(ApenasNumeros(DataModule1.getQuery(lNomeConsulta).FieldByName('cnpj').AsString), 14, '0') +
                  //FormatDateTime('dd/mm/yyyy', DataModule1.getQuery(lNomeConsulta).FieldByName('data_inicial').AsDateTime) +
                  //FormatDateTime('dd/mm/yyyy', DataModule1.getQuery(lNomeConsulta).FieldByName('data_final').AsDateTime) +
                  FormatDateTime('dd/mm/yyyy', dhInicio.Date) +
                  FormatDateTime('dd/mm/yyyy', dhFim.Date) +
                  'N' +
                  '05' +
                  '00000' +
                  '1' +
                  '17';

        lArquivo.Add(lLinha);

        lLinha := '02' +
                  AlignRight(ApenasNumeros(edtLote.Text), 7, '0') +
                  'X' +
                  FormatDateTime('dd/mm/yyyy', dhInicio.Date) +
                  AlignLeft('GERENTE', 30, ' ') +
                  AlignLeft('', 100, ' ');

        lArquivo.Add(lLinha);

        pComandoSQL := 'SELECT' + NewLine +
                       '  a.chave,' + NewLine +
                       '  b.debitar AS chave_debitar,' + NewLine +
                       '  c.codigo_externo AS debitar,' + NewLine +
                       '  c.descricao AS no_debitar,' + NewLine +
                       '  b.creditar AS chave_creditar,' + NewLine +
                       '  d.codigo_externo AS creditar,' + NewLine +
                       '  d.descricao AS no_creditar,' + NewLine +
                       '  CASE' + NewLine +
                       '    WHEN COALESCE(a.valor, 0) > 0 THEN a.valor' + NewLine +
                       '    WHEN COALESCE(a.entrada, 0) > 0 THEN a.entrada' + NewLine +
                       '    WHEN COALESCE(a.saida, 0) > 0 THEN a.saida' + NewLine +
                       '    ELSE 0' + NewLine +
                       '  END as valor,' + NewLine +
                       '  CASE' + NewLine +
                       '    WHEN NOT a.historico IS NULL THEN a.historico' + NewLine +
                       '    WHEN NOT a.pago_por IS NULL THEN ''Pago por '' || a.pago_por' + NewLine +
                       '    WHEN NOT a.fornecedor IS NULL THEN ''Pago a '' || a.fornecedor' + NewLine +
                       '    WHEN NOT a.cliente IS NULL THEN ''Pago por '' || a.cliente' + NewLine +
                       '    ELSE ''''' + NewLine +
                       '  END as historico' + NewLine +
                       'FROM' + NewLine +
                       '  lancamentos a' + NewLine +
                       '  JOIN vinculadores b ON (' + NewLine +
                       '    b.chave = a.vinculador)' + NewLine +
                       '  JOIN plano_contas c ON (' + NewLine +
                       '    c.chave = b.debitar)' + NewLine +
                       '  JOIN plano_contas d ON (' + NewLine +
                       '    d.chave = b.creditar)' + NewLine +
                       'WHERE' + NewLine +
                       '  a.empresa = ' + IntToStr(fEmpresaAtual) + NewLine;

        DataModule1.NovaConsulta(lNomeConsulta, pComandoSQL);

        iSequencial := 0;
        DataModule1.getQuery(lNomeConsulta).First;
        while not DataModule1.getQuery(lNomeConsulta).EOF do
        begin
          iSequencial := iSequencial + 1;

          {lLinha := '03' +
                    AlignRight(IntToStr(iSequencial), 7, '0') +
                    AlignRight(ApenasNumeros(DataModule1.getQuery(lNomeConsulta).FieldByName('debitar').AsString), 7, '0') +
                    AlignRight(ApenasNumeros(DataModule1.getQuery(lNomeConsulta).FieldByName('creditar').AsString), 7, '0') +
                    AlignRight(FormatFloat('##############0.00', DataModule1.getQuery(lNomeConsulta).FieldByName('valor').AsFloat), 15, '0') +
                    AlignRight(IntToStr(iSequencial), 7, '0') +
                    AlignLeft(ApenasNumeros(DataModule1.getQuery(lNomeConsulta).FieldByName('historico').AsString), 512, ' ') +
                    lCodigoEmpresa +
                    AlignLeft('', 100, ' ');}

          lLinha := '03' +
                    AlignRight(IntToStr(iSequencial), 7, '0') +
                    AlignRight(ApenasNumeros(DataModule1.getQuery(lNomeConsulta).FieldByName('debitar').AsString), 7, '0') +
                    AlignRight(ApenasNumeros(DataModule1.getQuery(lNomeConsulta).FieldByName('creditar').AsString), 7, '0') +
                    AlignRight(FormatFloat('##############0.00', DataModule1.getQuery(lNomeConsulta).FieldByName('valor').AsFloat), 15, '0');

          lLinha := lLinha +
                    AlignRight('0', 7, '0');
          lLinha := lLinha +
                    AlignLeft(DataModule1.getQuery(lNomeConsulta).FieldByName('historico').AsString, 512, ' ');
          lLinha := lLinha +
                    AlignLeft('', 7, ' ') +
                    AlignLeft('', 100, ' ');

          lArquivo.Add(lLinha);
          DataModule1.getQuery(lNomeConsulta).Next;
        end;

        lLinha := '99' +
                  AlignRight('9', 98, '9');

        lArquivo.Add(lLinha);
        lArquivo.SaveToFile(pNomeArquivo);
        result := true;
      end;
    except on e:exception do
      MensagemErro(e.Message, 'Erro');
    end;
  finally
    lArquivo.Free;
  end;
end;

function TfrmPrincipal.ExportarTabela(Empresa: Integer; pNomeTabela, pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
const
  lNomeConsulta = 'Integracao';
var
  i: Integer;
  lArquivo: TStringList;
  lLinha: String;
  pComandoSQL: String;
begin
  result := false;
  lArquivo := TStringList.Create;

  try
    try
      //Verificar se o arquivo já existe
      if FileExists(pNomeArquivo) then
        lArquivo.LoadFromFile(pNomeArquivo);

      //Montar SQL
      pComandoSQL := 'SELECT' + NewLine +
                     '  *' + NewLine +
                     'FROM' + NewLine +
                     '  ' + pNomeTabela + NewLine +
                     'WHERE' + NewLine;

      if (LowerCase(pNomeTabela) = 'empresa') then
        pComandoSQL := pComandoSQL + '  chave = ' + IntToStr(Empresa)
      else
        pComandoSQL := pComandoSQL + '  empresa = ' + IntToStr(Empresa);

      //Carregar lista de fields
      lLinha := '';
      if (DataModule1.NovaConsulta(lNomeConsulta, pComandoSQL) > 0) then
      begin
        for i := 0  to DataModule1.getQuery(lNomeConsulta).Fields.Count - 1 do
        begin
          //if (LowerCase(pNomeTabela) = 'empresa') or (LowerCase(DataModule1.getQuery(lNomeConsulta).Fields[i].FieldName) <> 'chave') then
            lLinha := lLinha + Trim(LowerCase(DataModule1.getQuery(lNomeConsulta).Fields[i].FieldName)) + '|';
        end;
      end;

      if not Vazio(lLinha) then
      begin
        lArquivo.Add('01|' + pNomeTabela);
        lLinha := '02|' + lLinha;
        lArquivo.Add(lLinha);
      end;

      //Montar valores
      DataModule1.getQuery(lNomeConsulta).First;

      while not (DataModule1.getQuery(lNomeConsulta).EOF) do
      begin
        lLinha := '';

        for i := 0  to DataModule1.getQuery(lNomeConsulta).Fields.Count - 1 do
        begin
          //if (LowerCase(pNomeTabela) = 'empresa') or (LowerCase(DataModule1.getQuery(lNomeConsulta).Fields[i].FieldName) <> 'chave') then
            lLinha := lLinha + Trim(DataModule1.getQuery(lNomeConsulta).FieldByName(DataModule1.getQuery(lNomeConsulta).Fields[i].FieldName).AsString) + '|';
        end;

        if not Vazio(lLinha) then
        begin
          lLinha := '03|' + lLinha;
          lArquivo.Add(lLinha);
        end;

        DataModule1.getQuery(lNomeConsulta).Next;
      end;

      lArquivo.SaveToFile(pNomeArquivo);
      result := true;
    except on e:exception do
      MensagemErro(e.Message, 'Erro');
    end;
  finally
    lArquivo.Free;
  end;
end;

function TfrmPrincipal.ImportarTabelas(pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
var
  lComandoSQL: String;
  lComandoSQLParte: String;
  lNomeTabela: String;
  lArquivo: TStringList;
  lLinha: TStringList;
  lTexto: String;
  i: Integer;
  y: Integer;
  lCampo: String;
  lVirgula: String;
begin
  result := false;

  if FileExists(pNomeArquivo) then
  begin
    lArquivo := TStringList.Create;
    lLinha := TStringList.Create;
    lLinha.Delimiter := '|';
    Cursor := crHourGlass;

    try
      try
        lArquivo.LoadFromFile(pNomeArquivo);

        for i := 0 to lArquivo.Count - 1 do
        begin
          lCampo := Copy(lArquivo.Strings[i], 1, 2);

          if (lCampo = '01') then
            lNomeTabela := Trim(Copy(lArquivo.Strings[i], 4, Length(lArquivo.Strings[i]) - 3))
          else if (lCampo = '02') then
          begin
            lComandoSQLParte := 'INSERT INTO ' + lNomeTabela + ' (';
            QuebrarString(lLinha, lArquivo.Strings[i]);
            //lLinha.DelimitedText := lArquivo.Strings[i];
            lVirgula := '';

            for y := 0 to lLinha.Count - 1 do
            begin
              if (lLinha.Strings[y] <> '02') then
              begin
                lComandoSQLParte := lComandoSQLParte + lVirgula + NewLine + '  ' + lLinha.Strings[y];
                lVirgula := ',';
              end;
            end;

            lComandoSQLParte := lComandoSQLParte + ')' + NewLine +
                                                   'VALUES (';
          end
          else if (lCampo = '03') then
          begin
            lTexto := lArquivo.Strings[i];

            QuebrarString(lLinha, lTexto);
            //lLinha.Delimiter := '|';
            //lLinha.DelimitedText := lTexto;

            lVirgula := '';
            lComandoSQL := lComandoSQLParte;

            for y := 0 to lLinha.Count - 1 do
            begin
              if (lLinha.Strings[y] <> '03') then
              begin
                if (Vazio(Trim(lLinha.Strings[y]))) then
                  lComandoSQL := lComandoSQL + lVirgula + NewLine + '  null'
                else
                  lComandoSQL := lComandoSQL + lVirgula + NewLine + '  ' + QuotedStr(Trim(lLinha.Strings[y]));
                lVirgula := ',';
              end;
            end;

            lComandoSQL := lComandoSQL + ')';

            DataModule1.Executar(lComandoSQL);
            Application.ProcessMessages;
          end;
        end;

        MensagemSucesso('Tabelas importadas com sucesso!', 'Importação de tabelas');
      except on e:exception do
        MensagemErro(e.Message, 'Importar Tabelas');
      end;
    finally
      Cursor := crDefault;
      FreeAndNil(lArquivo);
      FreeAndNil(lLinha);
    end;
  end;
end;

procedure TfrmPrincipal.QuebrarString(var pLista: TStringList; pString: String);
var
  lString: String;
  lParte: String;
begin
  lString := Trim(pString);
  pLista.Clear;

  while (Pos('|', lString) > 0) do
  begin
    lParte := Copy(lString, 1, Pos('|', lString) - 1);
    lString := Copy(lString, Pos('|', lString) + 1, Length(lString));

    pLista.Add(lParte);
  end;
end;

function TfrmPrincipal.AlignLeft(Texto: String; Tamanho: Integer; Caractere: Char): String;
var
  i: Integer;
  Caracteres: Integer;
begin
  if (Length(Texto) > Tamanho) then
    result := Copy(Texto, 1, Tamanho)
  else
  begin
    result := Trim(Texto);
    Caracteres := Tamanho - Length(Texto);

    for i := 1 to Caracteres do
      result := result + Caractere;
  end;
end;

function TfrmPrincipal.AlignRight(Texto: String; Tamanho: Integer; Caractere: Char): String;
var
  i: Integer;
  Caracteres: Integer;
begin
  if (Length(Texto) > Tamanho) then
    result := Copy(Texto, 1, Tamanho)
  else
  begin
    result := '';
    Caracteres := Tamanho - Length(Texto);

    for i := 1 to Caracteres do
      result := result + Caractere;

    result := result + Trim(Texto);
  end;
end;

procedure TfrmPrincipal.TotalizarValores;
var
  lTotal: Extended;
begin
  lTotal := 0;
  DataModule1.qLancamentos.DisableControls;

  try
    DataModule1.qLancamentos.First;

    while not (DataModule1.qLancamentos.EOF) do
    begin
      lTotal := lTotal + DataModule1.qLancamentos.FieldByName('valor').AsFloat + DataModule1.qLancamentos.FieldByName('entrada').AsFloat - DataModule1.qLancamentos.FieldByName('saida').AsFloat;

      DataModule1.qLancamentos.Next;
    end;

    lblTotalLancamento.Caption := FormatFloat('#,##0.00', lTotal);
  finally
    DataModule1.qLancamentos.EnableControls;

    if not DataModule1.qLancamentos.IsEmpty then
      DataModule1.qLancamentos.First;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  d, m, a: Word;
begin
  fGarbageCollector := TGarbageCollector.Create;

  fListaEmpresa := TListaCodigo.Create;
  fListaDebito := TStringList.Create;
  fListaDebito2 := TStringList.Create;
  fListaDebito3 := TStringList.Create;
  fListaDebito4 := TStringList.Create;
  fListaCredito := TStringList.Create;
  fListaCredito2 := TStringList.Create;
  fListaCredito3 := TStringList.Create;
  fListaCredito4 := TStringList.Create;
  fLayoutsDisponiveis := TStringList.Create;
  fLayoutsUtilizados := TStringList.Create;
  fLancamentoLayouts := TStringList.Create;
  fGarbageCollector.Add(fListaEmpresa);
  fGarbageCollector.Add(fListaDebito);
  fGarbageCollector.Add(fListaDebito2);
  fGarbageCollector.Add(fListaDebito3);
  fGarbageCollector.Add(fListaDebito4);
  fGarbageCollector.Add(fListaCredito);
  fGarbageCollector.Add(fListaCredito2);
  fGarbageCollector.Add(fListaCredito3);
  fGarbageCollector.Add(fListaCredito4);
  fGarbageCollector.Add(fLayoutsDisponiveis);
  fGarbageCollector.Add(fLayoutsUtilizados);
  fGarbageCollector.Add(fLancamentoLayouts);

  DecodeDate(Now, a, m, d);
  dhInicio.Date := EncodeDate(a, m, 1);
  dhFim.Date := Now;

  PrepararComboTipoPlanoContas;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fGarbageCollector);
  if Assigned(fListaTipoPlano) then
    FreeAndNil(fListaTipoPlano);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  CarregarListaEmpresa;
end;

procedure TfrmPrincipal.memAnotacoesExit(Sender: TObject);
begin
  GravarAnotacoes;
end;

procedure TfrmPrincipal.btnNovaEmpresaClick(Sender: TObject);
begin
  NovaEmpresa;
end;

procedure TfrmPrincipal.btnNovoLayoutClick(Sender: TObject);
begin
  NovoLayout;
end;

procedure TfrmPrincipal.Button10Click(Sender: TObject);
begin
  CancelarPlanoContas;
end;

procedure TfrmPrincipal.Button11Click(Sender: TObject);
begin
  DataModule1.qVinculadores.Next;
end;

procedure TfrmPrincipal.Button12Click(Sender: TObject);
begin
  DataModule1.qVinculadores.Prior;
end;

procedure TfrmPrincipal.btnGravarLayoutClick(Sender: TObject);
begin
  GravarLayout;
end;

procedure TfrmPrincipal.btnAdicionarDadosCampoClick(Sender: TObject);
begin
  if not Assigned(frmNovoCampo) then
    Application.CreateForm(TfrmNovoCampo, frmNovoCampo);

  frmNovoCampo.onGravarCampo := @GravarInserirCampo;

  if frmNovoCampo.ShowModal = mrOK then
  begin

  end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  DataModule1.Conexao.Connect;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtImportar.Text := OpenDialog1.FileName;
end;

procedure TfrmPrincipal.Button7Click(Sender: TObject);
begin
  GravarPlanoContas;
end;

procedure TfrmPrincipal.Button8Click(Sender: TObject);
begin
  EditarPlanoContas;
end;

procedure TfrmPrincipal.Button9Click(Sender: TObject);
begin
  NovoPlanoContas;
end;

procedure TfrmPrincipal.chkCamposDisponiveisClick(Sender: TObject);
begin
  MostrarDadosCampo(chkCamposDisponiveis.Items.Strings[chkCamposDisponiveis.ItemIndex], false);
end;

procedure TfrmPrincipal.chkCamposUtilizadosClick(Sender: TObject);
begin
  MostrarDadosCampo(chkCamposUtilizados.Items.Strings[chkCamposUtilizados.ItemIndex], true);
  CarregarListaDadosCampo(chkCamposUtilizados.Items.Strings[chkCamposUtilizados.ItemIndex]);
end;

procedure TfrmPrincipal.cmbEmpresaChange(Sender: TObject);
begin
  CarregarEmpresa(fListaEmpresa.Value(cmbEmpresa.ItemIndex));
end;

procedure TfrmPrincipal.cmbLancamentoLayoutChange(Sender: TObject);
begin
  fLancamentoLayoutAtual := StrToIntDef(fLancamentoLayouts.Strings[cmbLancamentoLayout.ItemIndex], 0);
  MontarTelaLancamento;
end;

procedure TfrmPrincipal.ComboValidator(Sender: TObject; var Key: char);
var
  lText: String;
  lSelStart: Integer;
  i: Integer;
  HasText: Boolean;
begin
  lText := TComboBox(Sender).Text;
  lSelStart := TComboBox(Sender).SelStart;

  if (lSelStart > 0) then
    lText := Copy(lText, 1, lSelStart);

  if (Key = #8) then
  begin
    lSelStart := lSelStart - 1;
    if not Vazio(lText) then
      lText := lText;
  end
  else
    lText := lText + Key;

  HasText := false;
  for i := 0 to TComboBox(Sender).Items.Count - 1 do
  begin
    if Pos(lText, TComboBox(Sender).Items.Strings[i]) = 1 then
    begin
      HasText := true;
      TComboBox(Sender).ItemIndex := i;
      TComboBox(Sender).Text := TComboBox(Sender).Items.Strings[i];
      TComboBox(Sender).SelStart := lSelStart;
      TComboBox(Sender).SelLength := Length(TComboBox(Sender).Text);
      break;
    end;
  end;

  if not HasText and (Key <> #8) then
    Key := #0;
end;

procedure TfrmPrincipal.CheckboxDrawItem(Control: TWinControl; Index: Integer; ARect: TRect; State: TOwnerDrawState);
begin
  if Index in [1,2] then
  begin
     Dec(ARect.Left,13);
     (Control as TCheckListBox).Canvas.FillRect(ARect);       { clear the rectangle }
     (Control as TCheckListBox).Canvas.TextOut(ARect.Left+13, ARect.Top, (Control as TCheckListBox).Items[Index])  { display the text }
  end else
  begin
     (Control as TCheckListBox).Canvas.FillRect(ARect);       { clear the rectangle }
     (Control as TCheckListBox).Canvas.TextOut(ARect.Left, ARect.Top, (Control as TCheckListBox).Items[Index])  { display the text }
  end;
  {
  if Index in [1,2] then
  begin
     Dec(Rect.Left,13);
     CheckListBox1.Canvas.FillRect(Rect);       { clear the rectangle }
     CheckListBox1.Canvas.TextOut(Rect.Left+13, Rect.Top, (Control as TCheckListBox).Items[Index])  { display the text }
  end else
  begin
     CheckListBox1.Canvas.FillRect(Rect);       { clear the rectangle }
     CheckListBox1.Canvas.TextOut(Rect.Left, Rect.Top, (Control as TCheckListBox).Items[Index])  { display the text }
  end;
  }
end;

procedure TfrmPrincipal.MenuItem5Click(Sender: TObject);
begin
  if not DataModule1.qLancamentos.IsEmpty and MensagemConfirmacao('Deseja realmente excluir esse lançamento?', 'Lançamentos') then
    ExcluirLancamento;
end;

procedure TfrmPrincipal.ComboBox3Change(Sender: TObject);
begin
  DataModule1.qPlanoContas.SortedFields := 'descricao';
  if ComboBox3.ItemIndex = 0 then
    DataModule1.qPlanoContas.SortType := stAscending
  else
    DataModule1.qPlanoContas.SortType := stDescending;
end;

procedure TfrmPrincipal.ComboBox4Change(Sender: TObject);
begin
  DataModule1.qPlanoContas.SortedFields := 'classificacao';
  if ComboBox4.ItemIndex = 0 then
    DataModule1.qPlanoContas.SortType := stAscending
  else
    DataModule1.qPlanoContas.SortType := stDescending;
end;

procedure TfrmPrincipal.dbgLancamentoDblClick(Sender: TObject);
begin
  EditarLancamento;
end;

procedure TfrmPrincipal.dbgLancamentoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(TDbGrid(Sender).DataSource.DataSet.RecNo) then
  begin
    if gdSelected in State then
      TDbGrid(Sender).Canvas.Brush.Color:= TColor($A0BCA0)
    else
      TDbGrid(Sender).Canvas.Brush.Color:= TColor($C0DCC0);
  end
  else
  begin
    if gdSelected in State then
      TDbGrid(Sender).Canvas.Brush.Color:= TColor($EFEFEF)
    else
      TDbGrid(Sender).Canvas.Brush.Color:= TColor($FFFFFF);
  end;

  TDbGrid(Sender).Canvas.font.Color:= clBlack;

  (Sender as TDBGrid).Canvas.FillRect(Rect);
  TDbGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPrincipal.DateValidator(Sender: TObject; var Key: char);
var
  IsDecimal: Boolean;
  IsNumber: Boolean;
  IsBackspace: Boolean;
  lNumbers: String;
  lNumbers1: String;
  lNumbers2: String;
  lLength: Integer;
  lDia: Integer;
  lMes: Integer;
  lAno: Integer;
  lDia1: String;
  lMes1: String;
  lAno1: String;
begin
  IsNumber := Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  IsBackspace := Key = #8;
  lDia := 0;
  lMes := 0;
  lAno := 0;

  if not IsNumber then
    key := #0;

  lLength := Length(ApenasNumeros(TEdit(Sender).Text));

  if (lLength < 8) then
    lNumbers := ApenasNumeros(TEdit(Sender).Text) + Key
  else
    lNumbers := Copy(ApenasNumeros(TEdit(Sender).Text), 1, 8);

  if IsBackspace and not Vazio(lNumbers) then
    lNumbers := Copy(lNumbers, 1, Length(lNumbers) - 2);

  lLength := Length(lNumbers);

  if (lLength >= 2) then
    lDia := StrToIntDef(Copy(lNumbers, 1, 2), 1);
  if (lLength >= 4) then
    lMes := StrToIntDef(Copy(lNumbers, 3, 2), 1);
  if (lLength >= 8) then
    lAno := StrToIntDef(Copy(lNumbers, 5, 4), 0);

  if (lMes > 12) then
    lMes := 12;

  if (lDia > 28) and (lMes = 2) and not IsLeapYear(lAno) then
    lDia := 28
  else if (lDia > 29) and (lMes = 2) then
    lDia := 29
  else if (lDia > 30) and (lMes in [4, 6, 9, 10]) then
    lDia := 30
  else if (lDia > 31) then
    lDia := 31;

  if (lLength = 3) then
    lMes1 := lNumbers[3]
  else if (lMes = 0) then
    lMes1 := ''
  else if (lMes < 10) then
    lMes1 := '0' + IntToStr(lMes)
  else
    lMes1 := IntToStr(lMes);

  if (lLength = 1) then
    lDia1 := lNumbers[1]
  else if (lDia = 0) then
    lDia1 := ''
  else if (lDia < 10) then
    lDia1 := '0' + IntToStr(lDia)
  else
    lDia1 := IntToStr(lDia);

  lNumbers1 := lDia1 + '/' + lMes1 + '/' + Copy(lNumbers, 5, Length(lNumbers));
  lNumbers2 := lDia1 + '/' + lMes1;

  if (lLength > 4) then
    TEdit(Sender).Text := lNumbers1
  else if (lLength > 2) then
    TEdit(Sender).Text := lNumbers2
  else
    TEdit(Sender).Text := lNumbers;

  TEdit(Sender).SelStart := Length(TEdit(Sender).Text);
  key := #0;
end;

procedure TfrmPrincipal.dbgLayoutsMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  CarregarLayout;
end;

procedure TfrmPrincipal.dbgPlano1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CarregarVinculador;
end;

procedure TfrmPrincipal.dbgPlanoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DataModule1.qPlanoContas.FieldByName('sintetica').AsString = 'S') then
  begin
    //dbgPlano.Canvas.Font.Color := clRed;
    dbgPlano.Canvas.Font.Style := [fsBold];
    dbgPlano.Canvas.FillRect(Rect);
    dbgPlano.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
    //dbgPlano.Canvas.Font.Color := clRed;
    dbgPlano.Canvas.Font.Style := [];
    dbgPlano.Canvas.FillRect(Rect);
    dbgPlano.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmPrincipal.dbgPlanoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CarregarTelaPlanoDeContas;
end;

procedure TfrmPrincipal.DecimalValidator(Sender: TObject; var Key: char);
var
  IsDecimal: Boolean;
  IsNumber: Boolean;
  IsBackspace: Boolean;
  IsInvalid: Boolean;
  lInteiro: String;
  lInteiro2: String;
  lDecimal: String;
  lTam: Integer;
  i: Integer;
begin
  IsDecimal := (Key = DecimalSeparator) and (Pos(DecimalSeparator, TEdit(Sender).Text) <= 0);
  IsNumber := Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  IsBackspace := Key = #8;

  if (fCampoEntrada <> nil) and (fCampoSaida <> nil) then
  begin
    if (TEdit(Sender).Name = fCampoEntrada.Name) then
      isInvalid := not Vazio(ApenasNumeros(fCampoSaida.Text))
    else if (TEdit(Sender).Name = fCampoSaida.Name) then
      isInvalid := not Vazio(ApenasNumeros(fCampoEntrada.Text))
    else
      isInvalid := false;
  end
  else
    IsInvalid := false;
  //if not IsDecimal and not IsNumber and not IsBackspace then
  //  key := #0;

  if IsInvalid then
  begin
    TEdit(Sender).Text := '';
    key := #0;
  end
  else if not IsBackspace then
  begin
    if IsDecimal then
    begin
      TEdit(Sender).Text := TEdit(Sender).Text + Key;
      key := #0;
    end
    else if IsNumber then
    begin
      if (pos(DecimalSeparator, TEdit(Sender).Text) > 0) then
      begin
        lInteiro := TEdit(Sender).Text;
        lInteiro := Copy(lInteiro, 1, pos(DecimalSeparator, lInteiro) - 1);
        lInteiro := ApenasNumeros(lInteiro);
        lInteiro := lInteiro;
        lDecimal := TEdit(Sender).Text;
        lDecimal := Copy(lDecimal, pos(DecimalSeparator, lDecimal) + 1, 2);
        if (Length(lDecimal) < 2) then
          lDecimal := lDecimal + Key;

        lInteiro2 := '';
        lTam := Length(lInteiro);
        for i := lTam downto 1 do
        begin
          if ((lTam - i) > 0) and ((lTam - i) mod 3 = 0) then
            lInteiro2 := lInteiro[i] + '.' + lInteiro2
          else
            lInteiro2 := lInteiro[i] + lInteiro2
        end;

        TEdit(Sender).Text := lInteiro2 + DecimalSeparator + lDecimal;
        key := #0;
      end
      else
      begin
        lInteiro := ApenasNumeros(TEdit(Sender).Text) + Key;

        lInteiro2 := '';
        lTam := Length(lInteiro);
        for i := lTam downto 1 do
        begin
          if ((lTam - i) > 0) and ((lTam - i) mod 3 = 0) then
            lInteiro2 := lInteiro[i] + '.' + lInteiro2
          else
            lInteiro2 := lInteiro[i] + lInteiro2
        end;

        TEdit(Sender).Text := lInteiro2;
        key := #0;
      end
    end
    else
      key := #0;
  end;

  TEdit(Sender).SelStart := Length(TEdit(Sender).Text);
end;

procedure TfrmPrincipal.DecimalExit(Sender: TObject);
var
  lInteiro: String;
  lInteiro2: String;
  lDecimal: String;
  lTam: Integer;
  i: Integer;
begin
  if (pos(DecimalSeparator, TEdit(Sender).Text) > 0) then
  begin
    lInteiro := TEdit(Sender).Text;
    lInteiro := Copy(lInteiro, 1, pos(DecimalSeparator, lInteiro) - 1);
    lInteiro := ApenasNumeros(lInteiro);
    lInteiro := lInteiro;
    lDecimal := TEdit(Sender).Text;
    lDecimal := Copy(lDecimal, pos(DecimalSeparator, lDecimal) + 1, 2);

    while (Length(lDecimal) < 2) do
      lDecimal := lDecimal + '0';

    lInteiro2 := '';
    lTam := Length(lInteiro);
    for i := lTam downto 1 do
    begin
      if ((lTam - i) > 0) and ((lTam - i) mod 3 = 0) then
        lInteiro2 := lInteiro[i] + '.' + lInteiro2
      else
        lInteiro2 := lInteiro[i] + lInteiro2
    end;

    TEdit(Sender).Text := lInteiro2 + DecimalSeparator + lDecimal;
  end
  else if not Vazio(ApenasNumeros(TEdit(Sender).Text)) then
  begin
    lInteiro := ApenasNumeros(TEdit(Sender).Text);

    lInteiro2 := '';
    lTam := Length(lInteiro);
    for i := lTam downto 1 do
    begin
      if ((lTam - i) > 0) and ((lTam - i) mod 3 = 0) then
        lInteiro2 := lInteiro[i] + '.' + lInteiro2
      else
        lInteiro2 := lInteiro[i] + lInteiro2
    end;

    TEdit(Sender).Text := lInteiro2 + ',00';
  end
end;

procedure TfrmPrincipal.Edit2KeyPress(Sender: TObject; var Key: char);
var
  IsDecimal: Boolean;
  IsNumber: Boolean;
  IsBackspace: Boolean;
  lNumbers: String;
  lNumbers1: String;
  lNumbers2: String;
  lLength: Integer;
  lDia: Integer;
  lMes: Integer;
  lAno: Integer;
  lDia1: String;
  lMes1: String;
  lAno1: String;
begin
  IsNumber := Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  IsBackspace := Key = #8;
  lDia := 0;
  lMes := 0;
  lAno := 0;

  if not IsNumber then
    key := #0;

  lLength := Length(ApenasNumeros(TEdit(Sender).Text));

  if (lLength < 8) then
    lNumbers := ApenasNumeros(TEdit(Sender).Text) + Key
  else
    lNumbers := Copy(ApenasNumeros(TEdit(Sender).Text), 1, 8);

  if IsBackspace and not Vazio(lNumbers) then
    lNumbers := Copy(lNumbers, 1, Length(lNumbers) - 1);

  lLength := Length(lNumbers);

  if (lLength >= 2) then
    lDia := StrToIntDef(Copy(lNumbers, 1, 2), 1);
  if (lLength >= 4) then
    lMes := StrToIntDef(Copy(lNumbers, 3, 2), 1);
  if (lLength >= 8) then
    lAno := StrToIntDef(Copy(lNumbers, 5, 4), 0);

  if (lMes > 12) then
    lMes := 12;

  if (lDia > 28) and (lMes = 2) and not IsLeapYear(lAno) then
    lDia := 28
  else if (lDia > 29) and (lMes = 2) then
    lDia := 29
  else if (lDia > 30) and (lMes in [4, 6, 9, 10]) then
    lDia := 30
  else if (lDia > 31) then
    lDia := 31;

  if (lLength = 3) then
    lMes1 := lNumbers[3]
  else if (lMes = 0) then
    lMes1 := ''
  else if (lMes < 10) then
    lMes1 := '0' + IntToStr(lMes)
  else
    lMes1 := IntToStr(lMes);

  if (lLength = 1) then
    lDia1 := lNumbers[1]
  else if (lDia = 0) then
    lDia1 := ''
  else if (lDia < 10) then
    lDia1 := '0' + IntToStr(lDia)
  else
    lDia1 := IntToStr(lDia);

  lNumbers1 := lDia1 + '/' + lMes1 + '/' + Copy(lNumbers, 5, Length(lNumbers));
  lNumbers2 := lDia1 + '/' + lMes1;

  if (lLength > 4) then
    TEdit(Sender).Text := lNumbers1
  else if (lLength > 2) then
    TEdit(Sender).Text := lNumbers2
  else
    TEdit(Sender).Text := lNumbers;

  TEdit(Sender).SelStart := Length(TEdit(Sender).Text);
  key := #0;
end;


procedure TfrmPrincipal.edtCNPJEmpresaKeyPress(Sender: TObject; var Key: char);
var
  lValorReal: String;
begin
  lValorReal := ApenasNumeros(edtCNPJEmpresa.Text);

  if (Length(lValorReal) <= 11) then
    edtCNPJEmpresa.Text := MascararTexto(ApenasNumeros(edtCNPJEmpresa.Text), 'XXX.XXX.XXX-XX')
  else
    edtCNPJEmpresa.Text := MascararTexto(ApenasNumeros(edtCNPJEmpresa.Text), 'XX.XXX.XXX/XXXX-XX');
  edtCNPJEmpresa.SelStart := Length(edtCNPJEmpresa.Text);
end;

procedure TfrmPrincipal.edtCodigoCreditarExit(Sender: TObject);
begin
  if not Vazio(edtCodigoCreditar.Text) and (fListaCredito2.IndexOf(ApenasNumeros(edtCodigoCreditar.Text)) > -1) then
  begin
    edtClassificacaoCreditar.Text := fListaCredito3.Strings[fListaCredito2.IndexOf(ApenasNumeros(edtCodigoCreditar.Text))];
    edtNomeCreditar.Text := fListaCredito4.Strings[fListaCredito2.IndexOf(ApenasNumeros(edtCodigoCreditar.Text))];
  end
  else
  begin
    edtCodigoCreditar.Text := '';
    edtClassificacaoCreditar.Text := '';
    edtNomeCreditar.Text := '';
  end;
end;

procedure TfrmPrincipal.edtCodigoCreditarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  lConsultarPlano: TfrmConsultarPlanoContas;
begin
  if (Key = 113) then
  begin
    lConsultarPlano := TfrmConsultarPlanoContas.Create(nil);

    try
      try
        lConsultarPlano.EmpresaSelecionada := fEmpresaAtual;
        lConsultarPlano.onRegistroSelecionado := @ConsultarVinculadorCredito;
        lConsultarPlano.Mascara := edtMascaraPlanoContas.Text;
        lConsultarPlano.Consultar;

        lConsultarPlano.ShowModal;
      except on e:exception do
        MensagemErro(e.Message, 'Vinculador');
      end;
    finally
      FreeAndNil(lConsultarPlano)
    end;
  end;
end;

procedure TfrmPrincipal.edtCodigoCreditarKeyPress(Sender: TObject; var Key: char
  );
begin
  if (Key <> #8) and (BuscarPlanoNaLista(fListaCredito, edtCodigoCreditar.Text + Key) <= -1) then
    Key := #0;
end;

procedure TfrmPrincipal.edtCodigoDebitarExit(Sender: TObject);
begin
  if not Vazio(edtCodigoDebitar.Text) and (fListaDebito2.IndexOf(ApenasNumeros(edtCodigoDebitar.Text)) > -1) then
  begin
    edtClassificacaoDebitar.Text := fListaDebito3.Strings[fListaDebito2.IndexOf(ApenasNumeros(edtCodigoDebitar.Text))];
    edtNomeDebitar.Text := fListaDebito4.Strings[fListaDebito2.IndexOf(ApenasNumeros(edtCodigoDebitar.Text))];
  end
  else
  begin
    edtCodigoDebitar.Text := '';
    edtClassificacaoDebitar.Text := '';
    edtNomeDebitar.Text := '';
  end;
end;

procedure TfrmPrincipal.edtCodigoDebitarKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
var
  lConsultarPlano: TfrmConsultarPlanoContas;
begin
  if (Key = 113) then
  begin
    lConsultarPlano := TfrmConsultarPlanoContas.Create(nil);

    try
      try
        lConsultarPlano.EmpresaSelecionada := fEmpresaAtual;
        lConsultarPlano.onRegistroSelecionado := @ConsultarVinculadorDebito;
        lConsultarPlano.Mascara := edtMascaraPlanoContas.Text;
        lConsultarPlano.Consultar;

        lConsultarPlano.ShowModal;
      except on e:exception do
        MensagemErro(e.Message, 'Vinculador');
      end;
    finally
      FreeAndNil(lConsultarPlano)
    end;
  end;
end;

procedure TfrmPrincipal.edtCodigoDebitarKeyPress(Sender: TObject; var Key: char
  );
begin
  if (Key <> #8) and (BuscarPlanoNaLista(fListaDebito, edtCodigoDebitar.Text + Key) <= -1) then
    Key := #0;
end;

procedure TfrmPrincipal.edtLoteKeyPress(Sender: TObject; var Key: char);
begin
  if (Key <> #8) and not (Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
    Key := #0;
end;

procedure TfrmPrincipal.edtMascaraPlanoContasChange(Sender: TObject);
begin
  CarregarPlanoDeContas(fEmpresaAtual);
end;

procedure TfrmPrincipal.edtPlanoContasClassificacao2Change(Sender: TObject);
begin
  CarregarPlanoDeContas(fEmpresaAtual);
end;

procedure TfrmPrincipal.edtPlanoContasClassificacao2KeyPress(Sender: TObject;
  var Key: char);
begin
  edtPlanoContasClassificacao2.Text := MascararTexto(ApenasNumeros(edtPlanoContasClassificacao2.Text), edtMascaraPlanoContas.Text);
  edtPlanoContasClassificacao2.SelStart := Length(edtPlanoContasClassificacao2.Text);
end;

procedure TfrmPrincipal.edtPlanoContasClassificacaoKeyPress(Sender: TObject;
  var Key: char);
begin
  edtPlanoContasClassificacao.Text := MascararTexto(ApenasNumeros(edtPlanoContasClassificacao.Text), edtMascaraPlanoContas.Text);
  edtPlanoContasClassificacao.SelStart := Length(edtPlanoContasClassificacao.Text);
end;

procedure TfrmPrincipal.edtPlanoContasDescricao2Change(Sender: TObject);
begin
  CarregarPlanoDeContas(fEmpresaAtual);
end;

procedure TfrmPrincipal.btnGravarEmpresaClick(Sender: TObject);
begin
  if GravarEmpresa then
    CarregarListaEmpresa;
end;

procedure TfrmPrincipal.btnGravarLancamentoClick(Sender: TObject);
begin
  GravarLancamento;
end;

procedure TfrmPrincipal.btnImportarClick(Sender: TObject);
begin
  if FileExists(edtImportar.Text) then
  begin
    if (cmbConjuntoImportacao.ItemIndex = 0) then
    begin
      if ImportarPlanoDeContas(fEmpresaAtual, edtImportar.Text, nil) then
      begin
        MensagemSucesso('Plano de contas importado com sucesso!', 'Sucesso');
      end;
    end
    else if (cmbConjuntoImportacao.ItemIndex = 1) then
    begin
      if ImportarTabelas(edtImportar.Text, nil) then
      begin
        MensagemSucesso('Dados da empresa importados com sucesso!', 'Sucesso');
      end;
    end;
  end;
end;

procedure TfrmPrincipal.btnNovaEmpresa1Click(Sender: TObject);
begin
  NovoVinculador;
end;

procedure TfrmPrincipal.btnEditarEmpresaClick(Sender: TObject);
begin
  EditarEmpresa;
end;

procedure TfrmPrincipal.btnEditarLayoutClick(Sender: TObject);
begin
  EditarLayout;
end;

procedure TfrmPrincipal.btnExportarClick(Sender: TObject);
var
  lSucesso: Boolean;
begin
  if (cmbConjuntoExportacao.ItemIndex = 0) then
  begin
    if ExportarDominio(fEmpresaAtual, edtExportar.Text, nil) then
      MensagemSucesso('Dados exportados com sucesso em ' + edtExportar.Text, 'Exportar dados');
  end
  else if (cmbConjuntoExportacao.ItemIndex = 1) then
  begin
    if FileExists(edtExportar.Text) then
      DeleteFile(edtExportar.Text);

    lSucesso := true;
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'empresa', edtExportar.Text, nil);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'plano_contas', edtExportar.Text, nil);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'layouts', edtExportar.Text, nil);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'layout_campos', edtExportar.Text, nil);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'layout_campos_dados', edtExportar.Text, nil);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'vinculadores', edtExportar.Text, nil);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'vinculadores_layout', TEdit(Sender).Text, nil);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'lancamentos', edtExportar.Text, nil);

    if (lSucesso) then
      MensagemSucesso('Dados exportados com sucesso em ' + edtExportar.Text, 'Exportar dados');
  end;
end;

procedure TfrmPrincipal.btnGravarEmpresa1Click(Sender: TObject);
begin
  edtCodigoEmpresa.Enabled := false;
  edtNomeEmpresa.Enabled := false;
  edtCNPJEmpresa.Enabled := false;
  CarregarListaEmpresa;
end;

procedure TfrmPrincipal.btnGravarEmpresa2Click(Sender: TObject);
begin
  if ValidarVinculador then
    GravarVinculador;
end;

procedure TfrmPrincipal.btnGravarEmpresa3Click(Sender: TObject);
begin
  CancelarVinculador;
end;

procedure TfrmPrincipal.btnEditarEmpresa1Click(Sender: TObject);
begin
  EditarVinculador;
end;

procedure TfrmPrincipal.btnCancelarLayoutClick(Sender: TObject);
begin
  CancelarLayout;
end;

procedure TfrmPrincipal.Arrow1Click(Sender: TObject);
var
  i: Integer;
  lSelected: boolean;
begin
  while TemCampoSelecionado(chkCamposDisponiveis) > -1 do
  begin
    i := TemCampoSelecionado(chkCamposDisponiveis);
    lSelected := chkCamposDisponiveis.Selected[i + 1];

    if PodeAdicionarCampo(i) then
    begin
      chkCamposUtilizados.Items.Add(chkCamposDisponiveis.Items.Strings[i]);
      chkCamposDisponiveis.Items.Delete(i);
    end;

    chkCamposDisponiveis.Selected[i] := lSelected;
  end;
end;

procedure TfrmPrincipal.Arrow2Click(Sender: TObject);
var
  i: Integer;
  lSelected: boolean;
begin
  while TemCampoSelecionado(chkCamposUtilizados) > -1 do
  begin
    if not (DataModule1.CampoLancamentoLocateDescricao(chkCamposUtilizados.Items.Strings[i]) > -1) or not DataModule1.CampoLancamentoObrigatorio then
    begin
      i := TemCampoSelecionado(chkCamposUtilizados);
      lSelected := chkCamposUtilizados.Selected[i + 1];

      chkCamposDisponiveis.Items.Add(chkCamposUtilizados.Items.Strings[i]);
      chkCamposUtilizados.Items.Delete(i);
      chkCamposUtilizados.Selected[i] := lSelected;
    end
    else
    begin
      i := TemCampoSelecionado(chkCamposUtilizados);
      chkCamposUtilizados.Selected[i] := false;
    end;
  end;
end;

procedure TfrmPrincipal.Arrow3Click(Sender: TObject);
var
  i: Integer;
  lSelected: boolean;
begin
  while TemCampoSelecionado(chkLayoutsUtilizados) > -1 do
  begin
    i := TemCampoSelecionado(chkLayoutsUtilizados);
    lSelected := chkLayoutsUtilizados.Selected[i + 1];

    chkLayoutsDisponiveis.Items.Add(chkLayoutsUtilizados.Items.Strings[i]);
    chkLayoutsUtilizados.Items.Delete(i);
    fLayoutsDisponiveis.Add(fLayoutsUtilizados.Strings[i]);
    fLayoutsUtilizados.Delete(i);
    chkLayoutsUtilizados.Selected[i] := lSelected;
  end;
end;

procedure TfrmPrincipal.Arrow4Click(Sender: TObject);
var
  i: Integer;
  lSelected: boolean;
begin
  while TemCampoSelecionado(chkLayoutsDisponiveis) > -1 do
  begin
    i := TemCampoSelecionado(chkLayoutsDisponiveis);
    lSelected := chkLayoutsDisponiveis.Selected[i + 1];

    chkLayoutsUtilizados.Items.Add(chkLayoutsDisponiveis.Items.Strings[i]);
    chkLayoutsDisponiveis.Items.Delete(i);
    fLayoutsUtilizados.Add(fLayoutsDisponiveis.Strings[i]);
    fLayoutsDisponiveis.Delete(i);
    chkLayoutsDisponiveis.Selected[i] := lSelected;
  end;
end;

procedure TfrmPrincipal.btnExcluirDadosCampoClick(Sender: TObject);
const
  lTabela = 'DadosCampos';
var
  lComando: String;
  i: Integer;
  lCampoAtual: Integer;
begin
  try
    if (chkCamposUtilizados.Items.Count > 0) and (chkCamposUtilizados.ItemIndex > -1) and Assigned(DataModule1.getQuery(lTabela)) and not (DataModule1.getQuery(lTabela).IsEmpty) then
    begin
      lComando := 'DELETE FROM' + NewLine +
                  '  layout_campos_dados' + NewLine +
                  'WHERE' + NewLine +
                   '  layout = ' + IntToStr(fLayoutAtual) + ' AND' + NewLine +
                   '  campo = ' + QuotedStr(chkCamposUtilizados.Items.Strings[chkCamposUtilizados.ItemIndex]) + ' AND' + NewLine +
                   '  dado = ' + QuotedStr(DataModule1.getQuery(lTabela).FieldByName('dado').AsString);

      DataModule1.Executar(lComando);

      CarregarListaDadosCampo(chkCamposUtilizados.Items.Strings[chkCamposUtilizados.ItemIndex]);
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Inserir Dados Campos Layout.');
  end;
end;

end.

