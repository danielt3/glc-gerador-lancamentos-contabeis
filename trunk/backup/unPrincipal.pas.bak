unit unPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, StdCtrls, DBGrids, DbCtrls, Buttons, Grids, CheckLst,
  EditBtn, ActnList, ExtCtrls, Arrow, ZConnection, unDataModule,
  unListaCodigo, unGarbageCollector, unUtilitario, db,
  RTTICtrls, types, ZAbstractRODataset, unNovoCampo, ShellAPI,
  unConsultarPlanoContas, fpspreadsheet, IpHtml, Ipfilebroker,
  lclproc, unStringGridController;

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
    btnCancelarLayout: TButton;
    btnCancelarLayout1: TButton;
    btnEditarEmpresa: TButton;
    btnEditarEmpresa1: TButton;
    btnEditarLayout: TButton;
    btnEditarLayout1: TButton;
    btnClienteGravar: TButton;
    btnFornecedorCancelar: TButton;
    btnClienteCancelar: TButton;
    btnFornecedorNovo: TButton;
    btnClienteNovo: TButton;
    btnFornecedorGravar: TButton;
    btnNovoProcesso: TButton;
    btnExcluirDadosCampo: TButton;
    btnExportar: TButton;
    btnExportar2: TButton;
    btnGravarEmpresa: TButton;
    btnGravarEmpresa1: TButton;
    btnGravarEmpresa2: TButton;
    btnGravarEmpresa3: TButton;
    btnGravarLayout: TButton;
    btnGravarLayout1: TButton;
    btnGravarCondicao: TButton;
    btnApagarCondicao: TButton;
    btnImportar: TButton;
    btnNovaEmpresa: TButton;
    btnNovaEmpresa1: TButton;
    btnNovoLayout: TButton;
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    btnGravarLancamento: TButton;
    btnFornecedorNext: TButton;
    btnClientePrior: TButton;
    btnClienteNext: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    btnFornecedorPrior: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    chkCamposDisponiveis: TCheckListBox;
    chkCamposProcessos: TCheckListBox;
    chkCamposUtilizados: TCheckListBox;
    chkLayoutsDisponiveis: TCheckListBox;
    chkLayoutsUtilizados: TCheckListBox;
    cmbEmpresa: TComboBox;
    cmbExportacaoLayout: TComboBox;
    cmbValorCondicao: TComboBox;
    cmbPlanoContasTipo2: TDBLookupComboBox;
    cmbTabelas: TComboBox;
    cmbLayoutFilho: TComboBox;
    cmbLayoutPai: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    cmbLancamentoLayout: TComboBox;
    cmbTipoImportacao: TComboBox;
    cmbConjuntoImportacao: TComboBox;
    cmbConjuntoExportacao: TComboBox;
    cmbTipoExportacao: TComboBox;
    cmbCondicoes: TComboBox;
    Conexao: TZConnection;
    dbgDadosCampos: TDBGrid;
    dbgLayouts: TDBGrid;
    dbgProcessos: TDBGrid;
    dhInicio: TDateEdit;
    dhFim: TDateEdit;
    dbgPlano1: TDBGrid;
    dbgLancamento: TDBGrid;
    Edit1: TEdit;
    edtFornecedorClassificacao: TEdit;
    edtFornecedorCodigo: TEdit;
    edtClienteClassificacao: TEdit;
    edtClienteCodigo: TEdit;
    edtFornecedorDescricao: TEdit;
    edtClienteDescricao: TEdit;
    edtValorCondicao: TEdit;
    edtCodigoDebitar: TEdit;
    edtCodigoCreditar: TEdit;
    edtClassificacaoDebitar: TEdit;
    edtClassificacaoCreditar: TEdit;
    edtFormatoCampo: TEdit;
    edtLote: TEdit;
    edtNomeDebitar: TEdit;
    edtNomeCreditar: TEdit;
    dbgPlano: TDBGrid;
    cmbPlanoContasTipo: TDBLookupComboBox;
    edtNomeLayout: TEdit;
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
    edtTabelas: TEdit;
    edtTamanhoCampo: TEdit;
    edtTipoCampo: TEdit;
    gbInformacoes: TGroupBox;
    gbNomeLayout: TGroupBox;
    gbTabelasDisponiveis: TGroupBox;
    gbTabelasUtilizadas: TGroupBox;
    gdbCaracteristicas: TGroupBox;
    gdbHistorico: TGroupBox;
    gdbOpcao: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    gbLancamentos: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
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
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
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
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label7: TLabel;
    lblTotalLancamento: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    memAnotacoes: TMemo;
    memConfHistorico: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl: TPageControl;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PageControl3: TPageControl;
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
    pLayoutCadastro: TTabSheet;
    sgCondicoes: TStringGrid;
    TabSheet1: TTabSheet;
    pProcesso: TTabSheet;
    TabSheet3: TTabSheet;
    Timer1: TTimer;
    procedure Arrow1Click(Sender: TObject);
    procedure Arrow2Click(Sender: TObject);
    procedure Arrow3Click(Sender: TObject);
    procedure Arrow4Click(Sender: TObject);
    procedure btnApagarCondicaoClick(Sender: TObject);
    procedure btnCancelarLayout1Click(Sender: TObject);
    procedure btnClienteCancelarClick(Sender: TObject);
    procedure btnClienteGravarClick(Sender: TObject);
    procedure btnClienteNextClick(Sender: TObject);
    procedure btnClienteNovoClick(Sender: TObject);
    procedure btnClientePriorClick(Sender: TObject);
    procedure btnEditarLayout1Click(Sender: TObject);
    procedure btnExcluirDadosCampoClick(Sender: TObject);
    procedure btnCancelarLayoutClick(Sender: TObject);
    procedure btnEditarEmpresa1Click(Sender: TObject);
    procedure btnEditarEmpresaClick(Sender: TObject);
    procedure btnEditarLayoutClick(Sender: TObject);
    procedure btnExportar2Click(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnFornecedorCancelarClick(Sender: TObject);
    procedure btnFornecedorGravarClick(Sender: TObject);
    procedure btnFornecedorNextClick(Sender: TObject);
    procedure btnFornecedorPriorClick(Sender: TObject);
    procedure btnGravarCondicaoClick(Sender: TObject);
    procedure btnGravarEmpresa1Click(Sender: TObject);
    procedure btnGravarEmpresa2Click(Sender: TObject);
    procedure btnGravarEmpresa3Click(Sender: TObject);
    procedure btnGravarEmpresaClick(Sender: TObject);
    procedure btnFornecedorNovoClick(Sender: TObject);
    procedure btnGravarLancamentoClick(Sender: TObject);
    procedure btnGravarLayout1Click(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnNovaEmpresa1Click(Sender: TObject);
    procedure btnNovaEmpresaClick(Sender: TObject);
    procedure btnNovoLayoutClick(Sender: TObject);
    procedure btnNovoProcessoClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure btnGravarLayoutClick(Sender: TObject);
    procedure btnAdicionarDadosCampoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure chkCamposDisponiveisClick(Sender: TObject);
    procedure chkCamposProcessosClick(Sender: TObject);
    procedure chkCamposUtilizadosClick(Sender: TObject);
    procedure cmbEmpresaChange(Sender: TObject);
    procedure cmbLancamentoLayoutChange(Sender: TObject);
    procedure cmbLayoutPaiChange(Sender: TObject);
    procedure cmbTipoExportacaoChange(Sender: TObject);
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
    procedure dbgProcessosCellClick(Column: TColumn);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure edtClienteClassificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCNPJEmpresaKeyPress(Sender: TObject; var Key: char);
    procedure edtCodigoCreditarExit(Sender: TObject);
    procedure edtCodigoCreditarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoCreditarKeyPress(Sender: TObject; var Key: char);
    procedure edtCodigoDebitarExit(Sender: TObject);
    procedure edtCodigoDebitarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoDebitarKeyPress(Sender: TObject; var Key: char);
    procedure edtFornecedorClassificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure GroupBox11Click(Sender: TObject);
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
    procedure IntegerValidator(Sender: TObject; var Key: char);
    procedure DecimalExit(Sender: TObject);
    procedure ComboValidator(Sender: TObject; var Key: char);
    procedure CheckboxDrawItem(Control: TWinControl; Index: Integer; ARect: TRect; State: TOwnerDrawState);
    procedure Timer1Timer(Sender: TObject);
  private
    //Geral
    fGarbageCollector: TGarbageCollector;
    //Empresa
    fEstadoEmpresa: TTipoAcao;
    fEmpresaAtual: Integer;
    fListaEmpresa: TListaCodigo;
    fEstadoFornecedor: TTipoAcao;
    fEstadoCliente: TTipoAcao;
    fCodigoFornecedores: String;
    fCodigoClientes: String;
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
    fModoContador: Boolean;
    //Processos
    fEstadoProcesso: TTipoAcao;
    pProcessoAtual: Integer;
    fCamposProcessos: TStringList;
    fCamposCondicoes: TStringGridController;

    //Geral
    function  FormatarDecimal(Valor: String): String;
    function  FormatarData(Valor: String): String;
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

    procedure ConsultarFornecedores(Empresa: Integer; Classificacao: String; PlanoAtual: Integer = 0);
    function  GerarClassificacaoFornecedor: String;
    function  GravarInserirFornecedor: Boolean;
    procedure ConsultarClientes(Empresa: Integer; Classificacao: String; PlanoAtual: Integer = 0);
    function  GerarClassificacaoCliente: String;
    function  GravarInserirCliente: Boolean;
    //Plano de Contas
    function  LimparPlanoDeContas(pEmpresa1: Integer): Boolean;
    function  ImportarPlanoDeContas(pEmpresa2: Integer; pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
    function  ImportarPlanoDeContas2(pEmpresa2: Integer; pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
    function  ExportarPlanoDeContas(pNomeArquivo: String): Boolean;
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

    function CopyBugado(pTexto: UTF8String; Inicio, Contador: Integer): UTF8String;
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
    procedure CarregarTabelasHistorico;
    function  TemOpcoesGravadas(pLayout: Integer; pNomeCampo: String): Boolean;

    procedure CriarOpcoesFormaPagamento;
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
    procedure CreateIntegerField(var pLeft: Integer; var pTop: Integer; pLength: Integer);
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

    procedure ToggleCliente;
    procedure AtivarModoContador;
    function  LerEmpresaPadrao: Integer;
    procedure GravarEmpresaPadrao(pEmpresaAtual: Integer);
    //Integração
    function  ExportarDominio(pNomeArquivo: String): Boolean;
    function  ExportarTabela(Empresa: Integer; pNomeTabela, pNomeArquivo: String): Boolean;
    function  ImportarTabelas(pNomeArquivo: String): Boolean;
    function  ExportarLancamentosExcel(Empresa, Layout: Integer; pNomeArquivo: String): Boolean;
    procedure QuebrarString(var pLista: TStringList; pString: String);
    function  AlignLeft(Texto: String; Tamanho: Integer; Caractere: Char = ' '): String;
    function  AlignRight(Texto: String; Tamanho: Integer; Caractere: Char = ' '): String;
    procedure TotalizarValores;
    //Validação
    procedure AtualizarArquivo;
    procedure GerarChave;
    function  Validar: Boolean;
    function  ValidarAtivacao: Boolean;
    function Encrypt(const s: string; Key: Word):String;
    function Decrypt(const s: string; Key: Word):String;

    //Processos
    procedure CarregarCamposLayoutPai;
    procedure SetarMascaraLayout(pCampo: String);
    function  ValidarProcesso: Boolean;
    procedure GravarProcesso;
    procedure InserirProcesso;
    procedure AlterarProcesso;
    procedure GravarCondicoes;
    procedure NovoProcesso;
    procedure HabilitarCamposProcessos(Habilitar: Boolean);
    procedure ConsultarProcessos(pEmpresa5: Integer);
    procedure CarregarProcesso;

    procedure ExecutarProcesso(pEmpresa6, pLayout, pLancamento: Integer);
    function  FieldToSQL(Campo: TField): String;
  public
    { public declarations }
  end; 

const
  c1 = 53641;
  c2 = 25519;
  ChaveGeral = 255;

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
                '  cnpj,' +
                '  fornecedores,' +
                '  clientes ' +
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
      GravarEmpresaPadrao(Empresa);
      lComando := DataModule1.qConsulta.FieldByName('fornecedores').AsString;
      ConsultarFornecedores(fEmpresaAtual, DataModule1.qConsulta.FieldByName('fornecedores').AsString)
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
begin
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
      pPlanoContas.TabVisible := true;
      DataModule1.qConsulta.First;
      while not DataModule1.qConsulta.EOF do
      begin
        cmbEmpresa.Items.Add(AlignLeft(DataModule1.qConsulta.FieldByName('nome').AsString, 30) + '-' + AlignRight(DataModule1.qConsulta.FieldByName('codigo').AsString, 6));
        fListaEmpresa.Add(DataModule1.qConsulta.FieldByName('chave').AsInteger);

        DataModule1.qConsulta.Next;
      end;

      if (fListaEmpresa.IndexOf(LerEmpresaPadrao) > -1) then
        fEmpresaAtual  := LerEmpresaPadrao;

      if DataModule1.qConsulta.Locate('chave', IntToStr(fEmpresaAtual), []) then
        cmbEmpresa.ItemIndex:= fListaEmpresa.IndexOf(fEmpresaAtual)
      else
        cmbEmpresa.ItemIndex:= 0;

      cmbEmpresaChange(cmbEmpresa);
    end
    else
    begin
      pPlanoContas.TabVisible := false;
      pLeiaute.TabVisible := false;
      pVinculador.TabVisible := false;
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
                 '  chave = ' + IntToStr(fEmpresaAtual);

  DataModule1.Executar(lComandoSQL);
end;

procedure TfrmPrincipal.ConsultarFornecedores(Empresa: Integer; Classificacao: String; PlanoAtual: Integer = 0);
var
  lComandoSQL: String;
begin
  try
    if Vazio(Classificacao) then
      lComandoSQL := 'SELECT' + NewLine +
                     '  chave,' + NewLine +
                     '  codigo,' + NewLine +
                     '  codigo_externo,' + NewLine +
                     '  descricao' + NewLine +
                     'FROM' + NewLine +
                     '  plano_contas' + NewLine +
                     'WHERE' + NewLine +
                     '  empresa = ' + IntToStr(Empresa) + NewLine +
                     '  AND chave < 0' + NewLine +
                     'ORDER BY' + NewLine +
                     '  codigo'
    else
      lComandoSQL := 'SELECT' + NewLine +
                     '  chave,' + NewLine +
                     '  codigo,' + NewLine +
                     '  codigo_externo,' + NewLine +
                     '  descricao' + NewLine +
                     'FROM' + NewLine +
                     '  plano_contas' + NewLine +
                     'WHERE' + NewLine +
                     '  empresa = ' + IntToStr(Empresa) + NewLine +
                     '  AND codigo LIKE ' + QuotedStr(Classificacao + '%') + NewLine +
                     '  AND codigo > ' + QuotedStr(Classificacao) + NewLine +
                     'ORDER BY' + NewLine +
                     '  codigo';

    DataModule1.qFornecedores.Close;
    DataModule1.qFornecedores.SQL.Clear;
    DataModule1.qFornecedores.SQL.Add(lComandoSQL);
    DataModule1.qFornecedores.Open;

    if not (DataModule1.qFornecedores.IsEmpty) then
    begin
      DataModule1.qFornecedores.Last;
      fCodigoFornecedores := Classificacao;

      if (PlanoAtual = 0) then
        DataModule1.qFornecedores.First
      else if not (DataModule1.qFornecedores.Locate('chave', fPlanoAtual, [])) then
        DataModule1.qFornecedores.First;

      edtFornecedorClassificacao.Text := MascararTexto(DataModule1.qFornecedores.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
      edtFornecedorDescricao.Text := DataModule1.qFornecedores.FieldByName('descricao').AsString;
      edtFornecedorCodigo.Text := DataModule1.qFornecedores.FieldByName('codigo_externo').AsString;

      lComandoSQL := 'UPDATE' + NewLine +
                     '  empresa' + NewLine +
                     'SET' + NewLine +
                     '  fornecedores = ' + QuotedStr(Classificacao) + NewLine +
                     'WHERE' + NewLine +
                     '  chave = ' + IntToStr(fEmpresaAtual);

      DataModule1.Executar(lComandoSQL);
    end
    else
    begin
      fCodigoFornecedores := '';
      edtFornecedorClassificacao.Text := '';
      edtFornecedorDescricao.Text := '';
      edtFornecedorCodigo.Text := '';
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Erro');
  end;
end;

function TfrmPrincipal.GerarClassificacaoFornecedor: String;
var
  lCodigoFornecedores: Integer;
  lTamanho: Integer;
  lInicio: Integer;
  lTexto: String;
  lFormatado: String;
  i: Integer;
begin
  result := '';
  lCodigoFornecedores := 0;

  if not (DataModule1.qFornecedores.IsEmpty) then
  begin
    lFormatado := MascararTexto(fCodigoFornecedores, edtMascaraPlanoContas.Text);

    lInicio := Length(lFormatado) + 1;

    DataModule1.qFornecedores.Last;
    lFormatado := MascararTexto(DataModule1.qFornecedores.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
    lFormatado := Copy(lFormatado, lInicio, Length(lFormatado));

    while not ENumero(lFormatado[1]) and (lFormatado[1] <> 'X') do
      lFormatado := Copy(lFormatado, 2, Length(lFormatado));

    if not Vazio(lFormatado) then
    begin
      lTexto := '';

      for i := 1 to Length(lFormatado) do
      begin
        if ENumero(lFormatado[i]) or (lFormatado[i] = 'X') then
          lTexto := lTexto + lFormatado[i]
        else
          Break;
      end;

      lTamanho := Length(lTexto);

      i := StrToIntDef(lTexto, 0);
      i := i + 1;

      result := MascararTexto(fCodigoFornecedores + AlignRight(IntToStr(i), lTamanho, '0'), edtMascaraPlanoContas.Text);;
    end;
  end;
end;

function TfrmPrincipal.GravarInserirFornecedor: Boolean;
begin
  result := false;

  if not Vazio(edtFornecedorDescricao.Text) then
  begin
    fPlanoAtual := DataModule1.GerarChave('GEN_PLANO_CONTAS');

    DataModule1.SQLBuilder.Clear;
    DataModule1.SQLBuilder.Add('INSERT INTO plano_contas (');
    DataModule1.SQLBuilder.Add('chave,');
    DataModule1.SQLBuilder.Add('empresa,');
    DataModule1.SQLBuilder.Add('codigo_externo,');
    DataModule1.SQLBuilder.Add('codigo,');
    DataModule1.SQLBuilder.Add('descricao,');
    DataModule1.SQLBuilder.Add('sintetica)');
    DataModule1.SQLBuilder.Add('VALUES (');
    DataModule1.SQLBuilder.Add('' + IntToStr(fPlanoAtual) + ',');
    DataModule1.SQLBuilder.Add('' + IntToStr(fEmpresaAtual) + ',');
    DataModule1.SQLBuilder.Add('' + QuotedStr(ApenasNumeros(edtFornecedorCodigo.Text)) + ',');
    DataModule1.SQLBuilder.Add('' + QuotedStr(ApenasNumeros(edtFornecedorClassificacao.Text)) + ',');
    DataModule1.SQLBuilder.Add('' + QuotedStr(Trim(edtFornecedorDescricao.Text)) + ',');
    DataModule1.SQLBuilder.Add('' + QuotedStr('S') + ')');
    DataModule1.SQLBuilder.Add('');
    result := DataModule1.Executar();

    fEstadoFornecedor := taNada;
    edtFornecedorDescricao.Enabled := false;
    ConsultarFornecedores(fEmpresaAtual, fCodigoFornecedores, fPlanoAtual);
  end;
end;

procedure TfrmPrincipal.ConsultarClientes(Empresa: Integer; Classificacao: String; PlanoAtual: Integer);
var
  lComandoSQL: String;
begin
  try
    if Vazio(Classificacao) then
      lComandoSQL := 'SELECT' + NewLine +
                     '  chave,' + NewLine +
                     '  codigo,' + NewLine +
                     '  codigo_externo,' + NewLine +
                     '  descricao' + NewLine +
                     'FROM' + NewLine +
                     '  plano_contas' + NewLine +
                     'WHERE' + NewLine +
                     '  empresa = ' + IntToStr(Empresa) + NewLine +
                     '  AND chave < 0' + NewLine +
                     'ORDER BY' + NewLine +
                     '  codigo'
    else
      lComandoSQL := 'SELECT' + NewLine +
                     '  chave,' + NewLine +
                     '  codigo,' + NewLine +
                     '  codigo_externo,' + NewLine +
                     '  descricao' + NewLine +
                     'FROM' + NewLine +
                     '  plano_contas' + NewLine +
                     'WHERE' + NewLine +
                     '  empresa = ' + IntToStr(Empresa) + NewLine +
                     '  AND codigo LIKE ' + QuotedStr(Classificacao + '%') + NewLine +
                     '  AND codigo > ' + QuotedStr(Classificacao) + NewLine +
                     'ORDER BY' + NewLine +
                     '  codigo';

    DataModule1.qClientes.Close;
    DataModule1.qClientes.SQL.Clear;
    DataModule1.qClientes.SQL.Add(lComandoSQL);
    DataModule1.qClientes.Open;

    if not (DataModule1.qClientes.IsEmpty) then
    begin
      DataModule1.qClientes.Last;
      fCodigoClientes := Classificacao;

      if (PlanoAtual = 0) then
        DataModule1.qClientes.First
      else if not (DataModule1.qClientes.Locate('chave', fPlanoAtual, [])) then
        DataModule1.qClientes.First;

      edtClienteClassificacao.Text := MascararTexto(DataModule1.qClientes.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
      edtClienteDescricao.Text := DataModule1.qClientes.FieldByName('descricao').AsString;
      edtClienteCodigo.Text := DataModule1.qClientes.FieldByName('codigo_externo').AsString;

      lComandoSQL := 'UPDATE' + NewLine +
                     '  empresa' + NewLine +
                     'SET' + NewLine +
                     '  clientes = ' + QuotedStr(Classificacao) + NewLine +
                     'WHERE' + NewLine +
                     '  chave = ' + IntToStr(fEmpresaAtual);

      DataModule1.Executar(lComandoSQL);
    end
    else
    begin
      fCodigoClientes := '';
      edtClienteClassificacao.Text := '';
      edtClienteDescricao.Text := '';
      edtClienteCodigo.Text := '';
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Erro');
  end;
end;

function TfrmPrincipal.GerarClassificacaoCliente: String;
var
  lCodigoClientes: Integer;
  lTamanho: Integer;
  lInicio: Integer;
  lTexto: String;
  lFormatado: String;
  i: Integer;
begin
  result := '';
  lCodigoClientes := 0;

  if not (DataModule1.qClientes.IsEmpty) then
  begin
    lFormatado := MascararTexto(fCodigoClientes, edtMascaraPlanoContas.Text);

    lInicio := Length(lFormatado) + 1;

    DataModule1.qClientes.Last;
    lFormatado := MascararTexto(DataModule1.qClientes.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
    lFormatado := Copy(lFormatado, lInicio, Length(lFormatado));

    while not ENumero(lFormatado[1]) and (lFormatado[1] <> 'X') do
      lFormatado := Copy(lFormatado, 2, Length(lFormatado));

    if not Vazio(lFormatado) then
    begin
      lTexto := '';

      for i := 1 to Length(lFormatado) do
      begin
        if ENumero(lFormatado[i]) or (lFormatado[i] = 'X') then
          lTexto := lTexto + lFormatado[i]
        else
          Break;
      end;

      lTamanho := Length(lTexto);

      i := StrToIntDef(lTexto, 0);
      i := i + 1;

      result := MascararTexto(fCodigoClientes + AlignRight(IntToStr(i), lTamanho, '0'), edtMascaraPlanoContas.Text);;
    end;
  end;
end;

function TfrmPrincipal.GravarInserirCliente: Boolean;
begin
  result := false;

  if not Vazio(edtClienteDescricao.Text) then
  begin
    fPlanoAtual := DataModule1.GerarChave('GEN_PLANO_CONTAS');

    DataModule1.SQLBuilder.Clear;
    DataModule1.SQLBuilder.Add('INSERT INTO plano_contas (');
    DataModule1.SQLBuilder.Add('chave,');
    DataModule1.SQLBuilder.Add('empresa,');
    DataModule1.SQLBuilder.Add('codigo_externo,');
    DataModule1.SQLBuilder.Add('codigo,');
    DataModule1.SQLBuilder.Add('descricao,');
    DataModule1.SQLBuilder.Add('sintetica)');
    DataModule1.SQLBuilder.Add('VALUES (');
    DataModule1.SQLBuilder.Add('' + IntToStr(fPlanoAtual) + ',');
    DataModule1.SQLBuilder.Add('' + IntToStr(fEmpresaAtual) + ',');
    DataModule1.SQLBuilder.Add('' + QuotedStr(ApenasNumeros(edtClienteCodigo.Text)) + ',');
    DataModule1.SQLBuilder.Add('' + QuotedStr(ApenasNumeros(edtClienteClassificacao.Text)) + ',');
    DataModule1.SQLBuilder.Add('' + QuotedStr(Trim(edtClienteDescricao.Text)) + ',');
    DataModule1.SQLBuilder.Add('' + QuotedStr('S') + ')');
    DataModule1.SQLBuilder.Add('');
    result := DataModule1.Executar();

    fEstadoCliente := taNada;
    edtClienteDescricao.Enabled := false;
    ConsultarClientes(fEmpresaAtual, fCodigoClientes, fPlanoAtual);
  end;
end;

function TfrmPrincipal.LimparPlanoDeContas(pEmpresa1: Integer): Boolean;
var
  lComandoSQL: String;
begin
  try
    {lComandoSQL := 'update' + NewLine +
                   '  PLANO_CONTAS' + NewLine +
                   'set' + NewLine +
                   '  EMPRESA_OLD = EMPRESA,' + NewLine +
                   '  EMPRESA = 0' + NewLine +
                   'where' + NewLine +
                   '  EMPRESA = ' + IntToStr(pEmpresa1);}
    lComandoSQL := 'delete from' + NewLine +
                   '  PLANO_CONTAS' + NewLine +
                   'where' + NewLine +
                   '  EMPRESA = ' + IntToStr(pEmpresa1);

    result := DataModule1.Executar(lComandoSQL);
  except on e:exception do
    MensagemErro(e.Message, 'Erro');
  end;
end;

function TfrmPrincipal.ImportarPlanoDeContas(pEmpresa2: Integer; pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
var
  lArquivo: TStringList;
  lNomeArquivoUTF8: String;
  i: Integer;

  lExterno: String;
  lCodigo: String;
  lDescricao: AnsiString;
  lSintetico: String;
begin
  result := false;
  try
    if FileExists(pNomeArquivo) then
    begin
      LimparPlanoDeContas(pEmpresa2);

      lArquivo := TStringList.Create;

      try
        lNomeArquivoUTF8 := ExtractFilePath(Application.ExeName) + 'contas_utf8.txt';
        ShellExecute(0,nil, PChar('cmd'),PChar('/c convert.bat "' + pNomeArquivo+  '" "' + lNomeArquivoUTF8 + '"'),nil,1);
        Sleep(1000);
        LimparPlanoDeContas(pEmpresa2);
        lArquivo.LoadFromFile(lNomeArquivoUTF8);

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
          lDescricao := UTF16ToUTF8(lArquivo.Strings[i]);
          lDescricao := Copy(lDescricao, 28, 40);
          lDescricao:= Trim(lDescricao);
          lSintetico := lArquivo.Strings[i];
          lSintetico:= CopyBugado(lSintetico, 68, 1);

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

function TfrmPrincipal.ImportarPlanoDeContas2(pEmpresa2: Integer; pNomeArquivo: String; pBarraProgresso: TProgressBar): Boolean;
const
  //LegalChar = '0123456789ABCDEFGHIJKLMNOPQRSTUVWYZ? ';
  lNumber = '0123456789';
var
  lArquivo: TextFile;
  lNomeArquivoUTF8: String;
  lLinha: String;
  i: Integer;

  lExterno: String;
  lCodigo: String;
  lDescricao: String;
  lSintetico: String;
  lChar: String;
begin
  result := false;
  try
    if FileExists(pNomeArquivo) then
    begin
      lNomeArquivoUTF8 := ExtractFilePath(Application.ExeName) + 'contas_utf8.txt';
      ShellExecute(0,nil, PChar('cmd'),PChar('/c convert.bat "' + pNomeArquivo+  '" "' + lNomeArquivoUTF8 + '"'),nil,1);
      Sleep(1000);
      LimparPlanoDeContas(pEmpresa2);
      Application.ProcessMessages;
      AssignFile(lArquivo, lNomeArquivoUTF8);

      try
        Reset(lArquivo);

        while not Eof(lArquivo) do
        begin
          ReadLn(lArquivo, lLinha);

          while not (UTF8Pos(lLinha[1], lNumber) > 0) do
            UTF8Delete(lLinha, 1, 1);

          lExterno := IntToStr(StrToIntDef(UTF8Copy(lLinha, 1, 7), 0));
          lCodigo := UTF8Copy(lLinha, 8, 20);
          lCodigo := ApenasNumeros(lCodigo);
          lDescricao := UTF8Encode(lLinha);
          lDescricao := UTF8Copy(lLinha, 28, 40);

          i := Length(lLinha);
          for i := Length(lLinha) downto 1 do
          begin
            lChar := lLinha[i];
            if not Vazio(lChar) then
            begin
              lSintetico := lChar;
              break;
            end;
          end;
          AdicionarPlanoDeContas(fEmpresaAtual, lExterno, lCodigo, lDescricao, lSintetico);
          if Assigned(pBarraProgresso) then
            pBarraProgresso.StepBy(1);
        end;

        result := true;
      finally
        // Close the file for the last time
        CloseFile(lArquivo);
        CarregarPlanoDeContas(fEmpresaAtual);
      end;
    end;
  finally
  end;
end;

function TfrmPrincipal.ExportarPlanoDeContas(pNomeArquivo: String): Boolean;
const
  lNomeConsulta = 'Integracao';
var
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
                     '  plano_contas' + NewLine +
                     'WHERE' + NewLine +
                     '  empresa = ' + IntToStr(fEmpresaAtual);

      lArquivo.Clear;;

      lLinha := '';
      if (DataModule1.NovaConsulta(lNomeConsulta, pComandoSQL) > 0) then
      begin
        DataModule1.getQuery(lNomeConsulta).First;

        while not (DataModule1.getQuery(lNomeConsulta).EOF) do
        begin
          lLinha := AlignRight(DataModule1.getQuery(lNomeConsulta).FieldByName('codigo_externo').AsString, 7, '0') +
                    AlignLeft(DataModule1.getQuery(lNomeConsulta).FieldByName('codigo').AsString, 20, ' ') +
                    AlignLeft(DataModule1.getQuery(lNomeConsulta).FieldByName('descricao').AsString, 40, ' ') +
                    DataModule1.getQuery(lNomeConsulta).FieldByName('sintetica').AsString;

          lArquivo.Add(UTF8Decode(lLinha));
          DataModule1.getQuery(lNomeConsulta).Next;
        end;
      end;

      lArquivo.SaveToFile(pNomeArquivo);
    except on e:exception do
      MensagemErro(e.Message, 'Erro');
    end;
  finally
    FreeAndNil(lArquivo);
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
  Application.ProcessMessages;
end;

function TfrmPrincipal.CarregarPlanoDeContas(pEmpresa4: Integer): Boolean;
var
  lComandoSQL: String;
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

  result := not DataModule1.qPlanoContas.IsEmpty;
  dbgPlano.DataSource := DataModule1.dsPlanoContas;
  CarregarTelaPlanoDeContas;
  ComboBox4Change(ComboBox4);
  HabilitarAbasAdicionais(not DataModule1.qPlanoContas.IsEmpty);
end;

procedure TfrmPrincipal.HabilitarAbasAdicionais(Habilitar: Boolean);
begin
  pLeiaute.TabVisible := Habilitar;
  pVinculador.TabVisible := Habilitar;
end;

function TfrmPrincipal.CarregarTelaPlanoDeContas: Boolean;
begin
  result := false;

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

  result := true;
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
begin
  edtCodigoDebitar.Text := fListaDebito2.Strings[fListaDebito.IndexOf(IntToStr(pRegistro))];
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

function TfrmPrincipal.CopyBugado(pTexto: UTF8String; Inicio, Contador: Integer): UTF8String;
var
  i: Integer;
  lTeste: AnsiString;
begin
  result := '';
  lTeste := UTF8Decode(pTexto);
  lTeste := '';

  for i := 1 to Length(pTexto) do
  begin
    lTeste := lTeste + pTexto[i];
    if (i >= Inicio) and (i < (Inicio + Contador)) then
      result := result + pTexto[i];
  end;

  lTeste := lTeste;
end;

function TfrmPrincipal.CarregarVinculadores(pEmpresa4: Integer): Boolean;
var
  lComandoSQL: String;
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
  else if Vazio(edtCodigoDebitar.Text) then
  begin
    MensagemAlerta('Nâo é permitido gravar  vinculador sem informar conta débito.', 'Erro');
    edtCodigoDebitar.SetFocus;
  end
  else if Vazio(edtCodigoCreditar.Text) then
  begin
    MensagemAlerta('Nâo é permitido gravar  vinculador sem informar conta crédito.', 'Erro');
    edtCodigoCreditar.SetFocus;
  end
  else
    result := true;
end;

function TfrmPrincipal.CarregarVinculador: Boolean;
begin
  result := false;

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

  result := true;
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
begin
  result := false;
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

  result := true;
end;

function TfrmPrincipal.CarregarLayoutsUtilizados: Boolean;
const
  lTabela = 'Vinculadores';
var
  lComandoSQL: String;
begin
  result := false;
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

  result := true;
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
  result := not DataModule1.qLayouts.IsEmpty;
  dbgLayouts.DataSource := DataModule1.dsLayouts;
  ConsultarProcessos(pEmpresa4);
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

  CarregarTabelasHistorico;
end;

procedure TfrmPrincipal.LimparTelaLayouts;
begin
  edtNomeLayout.Text := '';

  DataModule1.CarregarCamposDisponiveis(chkCamposDisponiveis);
  DataModule1.CarregarCamposUtilizados(chkCamposUtilizados);
end;

procedure TfrmPrincipal.HabilitarLayout(Habilitar: Boolean);
var
  PodeAlterar: Boolean;
begin
  PodeAlterar := not ExisteLancamentos;

  gbNomeLayout.Enabled := Habilitar and PodeAlterar;
  edtNomeLayout.Enabled := Habilitar and PodeAlterar;
  gbTabelasDisponiveis.Enabled := Habilitar and PodeAlterar;
  gbTabelasUtilizadas.Enabled := Habilitar;
  gdbCaracteristicas.Enabled := Habilitar and PodeAlterar;
  gdbOpcao.Enabled := Habilitar;
  gbInformacoes.Enabled := Habilitar;
  gdbHistorico.Enabled := Habilitar and PodeAlterar;
end;

procedure TfrmPrincipal.NovoLayout;
begin
  LimparTelaLayouts;

  fEstadoLayout := taInclusao;
  fLayoutAtual := DataModule1.GerarChave('GEN_LAYOUTS');;

  HabilitarLayout(true);

  PageControl.ActivePage := pContador;
  PageControl2.ActivePage := pLeiaute;
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
                     '  layout_campos_dados' + NewLine +
                     'WHERE' + NewLine +
                     '  layout = ' + IntToStr(fLayoutAtual);

      DataModule1.Executar(lComandoSQL);

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
    //if ExisteLancamentos then
    //  MensagemAlerta('Existem lançamentos para esse leiaute. Antes de alterá-lo é necessário primeiro apagar todos os lançamentos.', 'Erro')
    //else
    //begin
      CarregarLayout;
      fEstadoLayout := taEdicao;

      HabilitarLayout(true);

      PageControl.ActivePage := pContador;
      PageControl2.ActivePage := pLeiaute;

      if not ExisteLancamentos then
        edtNomeLayout.SetFocus;
    //end;
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

  if Vazio(edtNomeLayout.Text) then
  begin
    MensagemAlerta('Para gravar um leiaute, é necessário informar um nome.', 'Erro');
    result := false;
    exit;
  end
  else if not (CampoSendoUtilizado('*Valor')) and not (CampoSendoUtilizado('*Entrada')) and not (CampoSendoUtilizado('*Saída')) then
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
  end
  else if (CampoSendoUtilizado('#Forma de Pagamento')) and not (TemOpcoesGravadas(fLayoutAtual, '#Forma de Pagamento')) then
  begin
    MensagemAlerta('Não foram gravadas opções para a tabela Forma de Pagamento.', 'Erro');
    result := false;
    exit;
  end
  else if (CampoSendoUtilizado('#Tipo de Título')) and not (TemOpcoesGravadas(fLayoutAtual, '#Tipo de Título')) then
  begin
    MensagemAlerta('Não foram gravadas opções para a tabela Tipo de Título.', 'Erro');
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
  if (DataModule1.CampoLancamentoLocateDescricao(pDescricao) > -1) and HabilitarInsercao then
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

procedure TfrmPrincipal.CarregarTabelasHistorico;
var
  i: Integer;
begin
  cmbTabelas.Items.Clear;

  for i := 0 to chkCamposUtilizados.Items.Count - 1 do
    cmbTabelas.Items.Add(Copy(chkCamposUtilizados.Items.Strings[i], 2, 100));
end;

function TfrmPrincipal.TemOpcoesGravadas(pLayout: Integer; pNomeCampo: String): Boolean;
var
  lComandoSQL: String;
begin
  lComandoSQL := 'SELECT' + NewLine +
                 '  chave' + NewLine +
                 'FROM' + NewLine +
                 '  layout_campos_dados' + NewLine +
                 'WHERE' + NewLine +
                 '  empresa = ' + IntToStr(fEmpresaAtual) + ' AND' + NewLine +
                 '  layout = ' + IntToStr(pLayout) + ' AND' + NewLine +
                 '  campo = ' + QuotedStr(Trim(pNomeCampo));

  result := DataModule1.Consultar(lComandoSQL) > 0;
end;

procedure TfrmPrincipal.CriarOpcoesFormaPagamento;
var
  lComando: String;
  i: Integer;
  lCampoAtual: Integer;
  lOpcoes: TStringList;
begin
  lOpcoes := TStringList.Create;

  try
    try
      lOpcoes.Add('A VISTA');
      lOpcoes.Add('A PRAZO');
      lOpcoes.Add('OUTROS');

      for i := 0 to lOpcoes.Count - 1 do
      begin
        lComando := 'SELECT' + NewLine +
                    '  chave' + NewLine +
                    'FROM' + NewLine +
                    '  layout_campos_dados' + NewLine +
                    'WHERE' + NewLine +
                     '  layout = ' + IntToStr(fLayoutAtual) + ' AND' + NewLine +
                     '  dado = ' + QuotedStr(lOpcoes.Strings[i]) + ' AND' + NewLine +
                     '  campo = ' + QuotedStr(' Forma de Pagamento');

        if DataModule1.NovaConsulta('Consulta', lComando) = 0 then
        begin
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
                      '' + QuotedStr(' Forma de Pagamento') + ',' + NewLine +
                      '' + QuotedStr(lOpcoes.Strings[i]) + ')';

          DataModule1.Executar(lComando);
        end;
      end;

      CarregarListaDadosCampo(chkCamposUtilizados.Items.Strings[chkCamposUtilizados.ItemIndex]);
    except on e:exception do
      MensagemErro(e.Message, 'Inserir Dados Campos Layout.');
    end;
  finally
    FreeAndNil(lOpcoes);
  end;
end;

procedure TfrmPrincipal.CarregarLancamentoLayouts;
const
  lTabela = 'LancamentoLayouts';
var
  lComandoSQL: String;
begin
  cmbLancamentoLayout.Items.Clear;
  cmbExportacaoLayout.Items.Clear;
  cmbLayoutPai.Items.Clear;
  cmbLayoutFilho.Items.Clear;
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
      cmbExportacaoLayout.Items.Add(DataModule1.getQuery(lTabela).FieldByName('nome').AsString);
      cmbLayoutPai.Items.Add(DataModule1.getQuery(lTabela).FieldByName('nome').AsString);
      cmbLayoutFilho.Items.Add(DataModule1.getQuery(lTabela).FieldByName('nome').AsString);

      fLancamentoLayouts.Add(DataModule1.getQuery(lTabela).FieldByName('chave').AsString);

      DataModule1.getQuery(lTabela).Next;
    end;

    cmbLancamentoLayout.ItemIndex := 0;
    cmbExportacaoLayout.ItemIndex := 0;
    cmbLayoutPai.ItemIndex := 0;
    cmbLayoutFilho.ItemIndex := 0;
    fLayoutAtual := StrToIntDef(fLancamentoLayouts.Strings[0], 0);
    cmbLancamentoLayoutChange(cmbLancamentoLayout);
    CarregarCamposLayoutPai;
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
  lListaCampos: String;
begin
  fLeft := 16;
  fTop := 66;
  fLength := 1050;
  lListaCampos := '';

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

    lListaCampos := '';
    while not DataModule1.getQuery(lTabela).EOF do
    begin
      if (pos('|' + DataModule1.getQuery(lTabela).FieldByName('nome').AsString +  '|', lListaCampos) <1) then
      begin
        CriarCampoLancamento(DataModule1.getQuery(lTabela).FieldByName('nome').AsString);
        lListaCampos := lListaCampos + '|' + DataModule1.getQuery(lTabela).FieldByName('nome').AsString +  '|';
      end;

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
  else if (DataModule1.CampoLancamentoDados) or (DataModule1.CampoLancamentoNome = 'forma_pag') then
    CreateComboField(fLeft, fTop, fLength)
  else if (DataModule1.CampoLancamentoType = ftString) then
    CreateStringField(fLeft, fTop, fLength)
  else if (DataModule1.CampoLancamentoType = ftInteger) then
    CreateIntegerField(fLeft, fTop, fLength)
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
begin
  if not Assigned(fVinculadoresLayout) then
  begin
    fVinculadoresLayout := TStringList.Create;
    fGarbageCollector.Add(fVinculadoresLayout);
  end;

  fVinculadoresLayout.Clear;

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

procedure TfrmPrincipal.CreateIntegerField(var pLeft: Integer;var pTop: Integer; pLength: Integer);
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
  lEdit.Alignment := taRightJustify;
  lEdit.Text := '';
  lEdit.OnKeyPress := @IntegerValidator;
  //lEdit.OnExit := @DecimalExit;
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
  lEdit.Alignment := taRightJustify;
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
  //lCombo.Style := csSimple;
  lCombo.Left := pLeft;
  lCombo.Top := pTop;
  lCombo.Width := lWidth;
  lCombo.CharCase := ecUppercase;
  lCombo.Name := 'edtLanc_' + DataModule1.CampoLancamentoNome;
  lCombo.Text := '';
  lCombo.Visible := true;
  CarregarListaDadosCampoLancamento(lCombo, DataModule1.CampoLancamentoDescricao);

  if lCombo.Items.Count > 0 then
  begin
    lCombo.ItemIndex := 1;
    lCombo.Text := lCombo.Items.Strings[1];
  end;

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

  if DataModule1.Executar(lComandoSQL) then
    ExecutarProcesso(fEmpresaAtual, fLancamentoLayoutAtual, fLancamentoAtual);
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
  else if (DataModule1.CampoLancamentoType = ftInteger) then
    result := QuotedStr(TEdit(FindComponent('edtLanc_' + pNomeCampo)).Text)
  else if (DataModule1.CampoLancamentoType = ftFloat) then
  begin
    if Vazio(TEdit(FindComponent('edtLanc_' + pNomeCampo)).Text) then
      result := '0'
    else
    begin
      result := StringReplace(TEdit(FindComponent('edtLanc_' + pNomeCampo)).Text, ThousandSeparator, '', [rfReplaceAll]);
      result := StringReplace(result, DecimalSeparator, '.', [rfReplaceAll]);
      result := QuotedStr(result);
    end;
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

procedure TfrmPrincipal.ToggleCliente;
begin
  if not fModoContador then
    PageControl.ActivePage := pClientes;

  pContador.TabVisible := fModoContador;
  cmbEmpresa.Enabled := fModoContador;
end;

procedure TfrmPrincipal.AtivarModoContador;
var
  lLeitura: TStringList;
  lChave: String;
begin
  lLeitura := TStringList.Create;

  try
    if FileExists(ExtractFilePath(Application.ExeName) + 'utils.dll') then
    begin
      lLeitura.LoadFromFile(ExtractFilePath(Application.ExeName) + 'utils.dll');
      lChave := Trim(lLeitura.Strings[0]);

      if (lChave = '&5oO_p946') then
      begin
        fModoContador := true;
        Timer1.Enabled := true;
      end
      else
      begin
        cmbEmpresa.ItemIndex := fListaEmpresa.IndexOf(StrToIntDef(ApenasNumeros(lChave), 0));
        cmbEmpresaChange(cmbEmpresa);
        fModoContador := false;
      end;
    end
    else
      fModoContador := false;

    ToggleCliente;
  finally
    FreeandNil(lLeitura);
  end;
end;

function TfrmPrincipal.LerEmpresaPadrao: Integer;
var
  lArquivo: TStringList;
  lEmpresa: String;
begin
  result := fListaEmpresa.Value(0);
  lArquivo := TStringList.Create;

  try
    if (FileExists(ExtractFilePath(Application.ExeName) + 'default.dll')) then
    begin
      lArquivo.LoadFromFile(ExtractFilePath(Application.ExeName) + 'default.dll');
      lEmpresa := Trim(lArquivo.Strings[0]);
      result := StrToIntDef(ApenasNumeros(lEmpresa), 0);
    end;
  finally
    FreeAndNil(lArquivo);
  end;
end;

procedure TfrmPrincipal.GravarEmpresaPadrao(pEmpresaAtual: Integer);
var
  lArquivo: TStringList;
begin
  lArquivo := TStringList.Create;

  try
    lArquivo.Clear;
    lArquivo.Add(IntToStr(pEmpresaAtual));
    lArquivo.SaveToFile(ExtractFilePath(Application.ExeName) + 'default.dll');
  finally
    FreeAndNil(lArquivo);
  end;
end;

function TfrmPrincipal.ExportarDominio(pNomeArquivo: String): Boolean;
const
  lNomeConsulta = 'Integracao';
var
  iSequencial: Integer;
  lArquivo: TStringList;
  lLinha: String;
  pComandoSQL: String;
  lCodigoEmpresa: String;
  lLote: Integer;
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

        lLote := StrToIntDef(ApenasNumeros(edtLote.Text), 0);

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
                       '    WHEN NOT b.historico IS NULL THEN b.historico' + NewLine +
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

          lLinha := '02' +
                    AlignRight(IntToStr(lLote), 7, '0') +
                    'X' +
                    FormatDateTime('dd/mm/yyyy', dhInicio.Date) +
                    AlignLeft('GERENTE', 45, ' ') +
                    AlignLeft('N', 100, ' ');

          lArquivo.Add(lLinha);

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
                    AlignRight(StringReplace(FormatFloat('##############0.00', DataModule1.getQuery(lNomeConsulta).FieldByName('valor').AsFloat), DecimalSeparator, '', [rfReplaceAll]), 15, '0');

          lLinha := lLinha +
                    AlignRight('0', 7, '0');
          lLinha := lLinha +
                    AlignLeft(DataModule1.getQuery(lNomeConsulta).FieldByName('historico').AsString, 512, ' ');
          lLinha := lLinha +
                    lCodigoEmpresa +
                    AlignLeft('', 100, ' ');

          lArquivo.Add(lLinha);
          DataModule1.getQuery(lNomeConsulta).Next;

          lLote := lLote + 1;
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

function TfrmPrincipal.ExportarTabela(Empresa: Integer; pNomeTabela, pNomeArquivo: String): Boolean;
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

function TfrmPrincipal.ImportarTabelas(pNomeArquivo: String): Boolean;
const
  lConsulta = 'ConsultaChave';
var
  lComandoSQL: String;
  lComandoSQLParte: String;
  lComandoSQLExisteEmpresa: String;
  lNomeTabela: String;
  lArquivo: TStringList;
  lLinha: TStringList;
  lCampos: TStringList;
  lTexto: String;
  i: Integer;
  y: Integer;
  lCampo: String;
  lNomeCampo: String;
  lVirgula: String;

  lExisteChave: String;
  lExisteEmpresa: String;

  lChave: Integer;
begin
  result := false;

  if FileExists(pNomeArquivo) then
  begin
    lArquivo := TStringList.Create;
    lLinha := TStringList.Create;
    lCampos := TStringList.Create;
    lLinha.Delimiter := '|';
    lCampos.Delimiter := '|';
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
            lCampos.Clear;
            lCampos.Add('-');
            //lLinha.DelimitedText := lArquivo.Strings[i];
            lVirgula := '';

            for y := 0 to lLinha.Count - 1 do
            begin
              if (lLinha.Strings[y] <> '02') then
              begin
                lComandoSQLParte := lComandoSQLParte + lVirgula + NewLine + '  ' + lLinha.Strings[y];
                lCampos.Add(lLinha.Strings[y]);
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

            lVirgula := '';
            lComandoSQL := lComandoSQLParte;

            for y := 0 to lLinha.Count - 1 do
            begin
              lNomeCampo := lCampos.Strings[y];
              if (lLinha.Strings[y] <> '03') then
              begin
                if (Vazio(Trim(lLinha.Strings[y]))) then
                begin
                  lComandoSQL := lComandoSQL + lVirgula + NewLine + '  null';
                end
                else
                begin
                  if (UpperCase(lNomeCampo) = 'CHAVE') then
                    lExisteChave := Trim(lLinha.Strings[y])
                  else if (UpperCase(lNomeCampo) = 'EMPRESA') then
                    lExisteEmpresa := Trim(lLinha.Strings[y]) ;

                  if (DataModule1.TipoCampo(lNomeTabela, lNomeCampo) = 'DATE') then
                  begin
                    lComandoSQL := lComandoSQL + lVirgula + NewLine + '  ' + QuotedStr(StringReplace(Trim(lLinha.Strings[y]), '/', '.', [rfReplaceAll]));
                  end
                  else if (DataModule1.TipoCampo(lNomeTabela, lNomeCampo) = 'DECIMAL') then
                  begin
                    lComandoSQL := lComandoSQL + lVirgula + NewLine + '  ' + QuotedStr(StringReplace(Trim(lLinha.Strings[y]), ',', '.', [rfReplaceAll]));
                  end
                  else
                    lComandoSQL := lComandoSQL + lVirgula + NewLine + '  ' + QuotedStr(Trim(lLinha.Strings[y]));
                end;
                lVirgula := ',';
              end;
            end;

            lComandoSQL := lComandoSQL + ')';

            if (UpperCase(lNomeTabela) = 'EMPRESA') then
              lComandoSQLExisteEmpresa := 'SELECT * FROM ' + lNomeTabela + ' WHERE CHAVE = ' + lExisteChave
            else
              lComandoSQLExisteEmpresa := 'SELECT * FROM ' + lNomeTabela + ' WHERE CHAVE = ' + lExisteChave + ' AND EMPRESA = ' + lExisteEmpresa;

            if not (DataModule1.Consultar(lComandoSQLExisteEmpresa) > 0) then
              DataModule1.Executar(lComandoSQL);

            lComandoSQL := 'SELECT MAX(chave) AS chave FROM ' + lNomeTabela;
            DataModule1.NovaConsulta(lConsulta, lComandoSQL);
            lChave := DataModule1.getQuery(lConsulta).FieldByName('chave').AsInteger;
            lComandoSQL := 'SET GENERATOR gen_' + lNomeTabela + ' TO ' + IntToStr(lChave);
            DataModule1.Executar(lComandoSQL);

            Application.ProcessMessages;
          end;
        end;

        CarregarListaEmpresa;
        MensagemSucesso('Tabelas importadas com sucesso!', 'Importação de tabelas');
      except on e:exception do
        MensagemErro(e.Message, 'Importar Tabelas');
      end;
    finally
      Cursor := crDefault;
      FreeAndNil(lArquivo);
      FreeAndNil(lLinha);
      FreeAndNil(lCampos);
    end;
  end;
end;

function TfrmPrincipal.ExportarLancamentosExcel(Empresa, Layout: Integer; pNomeArquivo: String): Boolean;
const
  lNomeConsulta2 = 'CamposExcel';
  lNomeConsulta = 'GerarExcel';
  OUTPUT_FORMAT = sfExcel8;
var
  pComandoSQL: String;
  lLinha: Integer;
  lColuna: Integer;
  MyWorkbook: TsWorkbook;
  MyWorksheet: TsWorksheet;
  //MyFormula: TsRPNFormula;
begin
  result := false;

  try
    try
      if FileExists(pNomeArquivo) then
        DeleteFile(pNomeArquivo);

      {pComandoSQL := 'SELECT' + NewLine +
                     '  b.nome' + NewLine +
                     'FROM' + NewLine +
                     '  layouts a' + NewLine +
                     '  JOIN layout_campos b ON (' + NewLine +
                     '    b.layout = a.chave)' + NewLine +
                     'WHERE' + NewLine +
                     '  a.chave = ' + IntToStr(Layout);}

        pComandoSQL := 'SELECT' + NewLine +
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

      DataModule1.NovaConsulta(lNomeConsulta2, pComandoSQL);

      if not DataModule1.getQuery(lNomeConsulta2).IsEmpty then
      begin
        MyWorkbook := TsWorkbook.Create;
        MyWorksheet := MyWorkbook.AddWorksheet('GLC');

        DataModule1.getQuery(lNomeConsulta2).First;
        lColuna := 0;
        while not (DataModule1.getQuery(lNomeConsulta2).Eof) do
        begin
          DataModule1.CampoLancamentoLocate(DataModule1.getQuery(lNomeConsulta2).FieldByName('nome').AsString);
          MyWorksheet.WriteUTF8Text(0, lColuna, Copy(DataModule1.CampoLancamentoDescricao, 2, 100));
          lColuna := lColuna + 1;

          DataModule1.getQuery(lNomeConsulta2).Next;
        end;

        pComandoSQL := 'SELECT' + NewLine +
                       '  a.chave,' + NewLine +
                       '  b.debitar AS chave_debitar,' + NewLine +
                       '  c.codigo_externo AS debitar,' + NewLine +
                       '  c.descricao AS no_debitar,' + NewLine +
                       '  b.creditar AS chave_creditar,' + NewLine +
                       '  d.codigo_externo AS creditar,' + NewLine +
                       '  d.descricao AS no_creditar,' + NewLine +
                       '  a.data_pag AS data_pag,' + NewLine +
                       '  b.descricao AS no_vinculador,' + NewLine;

        DataModule1.getQuery(lNomeConsulta2).First;
        while not (DataModule1.getQuery(lNomeConsulta2).Eof) do
        begin
          //if (Pos(Trim(DataModule1.getQuery(lNomeConsulta).FieldByName('nome').AsString), 'entrada, saida, forma_pag, nota_fiscal, pago_por, fornecedor, cliente, numero') > 0) then
          pComandoSQL := pComandoSQL + '  a.' + Trim(DataModule1.getQuery(lNomeConsulta2).FieldByName('nome').AsString) + ' AS ' + Trim(DataModule1.getQuery(lNomeConsulta2).FieldByName('nome').AsString) + ',' + NewLine;

          DataModule1.getQuery(lNomeConsulta2).Next;
        end;

        pComandoSQL := pComandoSQL +
                       '  CASE' + NewLine +
                       '    WHEN NOT a.historico IS NULL THEN a.historico' + NewLine +
                       '    WHEN NOT a.pago_por IS NULL THEN ''Pago por '' || a.pago_por' + NewLine +
                       '    WHEN NOT a.fornecedor IS NULL THEN ''Pago a '' || a.fornecedor' + NewLine +
                       '    WHEN NOT a.cliente IS NULL THEN ''Pago por '' || a.cliente' + NewLine +
                       '    WHEN NOT b.historico IS NULL THEN b.historico' + NewLine +
                       '    ELSE ''''' + NewLine +
                       '  END as historico' + NewLine +
                       'FROM' + NewLine +
                       '  lancamentos a' + NewLine +
                       '  LEFT JOIN vinculadores b ON (' + NewLine +
                       '    b.chave = a.vinculador)' + NewLine +
                       '  LEFT JOIN plano_contas c ON (' + NewLine +
                       '    c.chave = b.debitar)' + NewLine +
                       '  LEFT JOIN plano_contas d ON (' + NewLine +
                       '    d.chave = b.creditar)' + NewLine +
                       'WHERE' + NewLine +
                       '  a.empresa = ' + IntToStr(Empresa) + NewLine +
                       '  AND a.layout = ' + IntToStr(Layout) + NewLine;

        DataModule1.NovaConsulta(lNomeConsulta, pComandoSQL);

        DataModule1.getQuery(lNomeConsulta).First;
        lLinha := 1;
        while not DataModule1.getQuery(lNomeConsulta).EOF do
        begin
          DataModule1.getQuery(lNomeConsulta2).First;
          lColuna := 0;
          while not (DataModule1.getQuery(lNomeConsulta2).Eof) do
          begin
            DataModule1.CampoLancamentoLocate(DataModule1.getQuery(lNomeConsulta2).FieldByName('nome').AsString);

            MyWorksheet.WriteUTF8Text(lLinha, lColuna, DataModule1.getQuery(lNomeConsulta).FieldByName(DataModule1.getQuery(lNomeConsulta2).FieldByName('nome').AsString).AsString);
            lColuna := lColuna + 1;

            DataModule1.getQuery(lNomeConsulta2).Next;
          end;

          //MyWorksheet.WriteNumber(lLinha, 0, DataModule1.getQuery(lNomeConsulta).FieldByName('chave').AsInteger);

          DataModule1.getQuery(lNomeConsulta).Next;
          lLinha := lLinha + 1;
        end;

        MyWorkbook.WriteToFile(pNomeArquivo, OUTPUT_FORMAT);
      end;

      result := true;
    except on e:exception do
      MensagemErro(e.Message, 'Erro');
    end;
  finally
    MyWorkbook.Free;
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

procedure TfrmPrincipal.AtualizarArquivo;
var
  lArquivo: TStringList;
  lNomeArquivo: String;
begin
  lArquivo := TStringList.Create;

  try
    try
      lNomeArquivo  := ExtractFilePath(Application.ExeName) + 'fbdata.dll';
      if FileExists(lNomeArquivo) then
        DeleteFile(lNomeArquivo);

      //lArquivo.Add('SDF4S4F5S6D4F65S4&@5@10S4DF45@##001988');
      //lArquivo.Add('FAT000000000000000000013334548OIUU$##A');
      //lArquivo.Add('A4A56S4D5_2A1DDDD$DDDDD21232132A212FED');
      //lArquivo.Add('AAA41000SAD2154=$121212$CC$AA$DD212481');
      //lArquivo.Add('KLM12%&!!15002003=#@0035AA21$$DD$D$A$S');
      //lArquivo.Add('@135DDA3215815121S2##=$S$D$S$A$5511ADD');
      //lArquivo.Add('$NB$B5411=00_________09$LED25500155001');
      //lArquivo.Add('TAB5222@0003SD@05ASDDDDGGH211003_80002');
      //lArquivo.Add('85AOOODPLLANSDNUMBRELLACORP544#$D00003');

      lArquivo.Add('SDF4S4F5S6D4F65S4&@5@10S4DF45@##001988');
      lArquivo.Add('FAT000000000000000000013334548OIUU$##A');
      lArquivo.Add('A4A56S4D542A1DDDD$DDDDD21232132A212FED');
      lArquivo.Add('AAA41000SAD2154=$121212$CC$AA$DD212481');
      lArquivo.Add('KLM12%&!!15002003=#@0035AA21$$DD$D$A$S');
      lArquivo.Add('@135DDA3215815121S2##=$S$D$S$A$5511ADD');
      lArquivo.Add('$NB$B5411=0060002AAI009$LED25500155001');
      lArquivo.Add('TAB5222@0003SD@05ASDDDDGGH211003880002');
      lArquivo.Add('85AOOODPLLANSDNUMBRELLACORP544#$D00003');
    except on e:exception do
      MensagemErro(e.Message, 'Erro');
    end;
  finally
    FreeAndNil(lArquivo);
  end;
end;

procedure TfrmPrincipal.GerarChave;
var
  Linha1, Linha2, Linha3: String;
  dia, mes, ano: word;
  ldia, lmes, lano: String;
  lArquivo: TStringList;
begin
  lArquivo := TStringList.Create;

  try
    DecodeDate(Now, ano, mes, dia);
    lDia := AlignRight(IntToStr(dia), 2, '0');
    lMes := AlignRight(IntToStr(mes), 2, '0');

    if (ano - 2000 < 0) then
      lAno := '00'
    else
      lAno := AlignRight(IntToStr(ano - 2000), 2, '0');

    //lDia := '05';
    //lMes := '05';

    ///////////123456789112345678921234567893123456789412345678
    Linha1 := 'FAT000000000000000000' + lDia + '3334548OIUU$##A';
    Linha2 := 'A4A56S4D542A1DDDD$DDDDD21232132A2' + lMes + 'FED';
    Linha3 := '@135DDA32158' + lAno + '#21S2##=$S$D$S$A$5511ADD';

    lArquivo.Add(Encrypt('SDF4S4F5S6D4F65S4&@5@10S4DF45@##001988', ChaveGeral));
    lArquivo.Add(Encrypt(Linha1, ChaveGeral));
    lArquivo.Add(Encrypt(Linha2, ChaveGeral));
    lArquivo.Add(Encrypt('AAA41000SAD2154=$121212$CC$AA$DD212481', ChaveGeral));
    lArquivo.Add(Encrypt('KLM12%[!!15002003=#@0035AA21$$DD$D$A$S', ChaveGeral));
    lArquivo.Add(Encrypt(Linha3, ChaveGeral));
    lArquivo.Add(Encrypt('$NB$B5411=0060002AAI009$LED25500155001', ChaveGeral));
    lArquivo.Add(Encrypt('TAB5222@0003SD@05ASDDDDGGH211003880002', ChaveGeral));
    lArquivo.Add(Encrypt('85AOOODPLLANSDNUMBRELLACORP544#$D00003', ChaveGeral));

    lArquivo.SaveToFile(ExtractFilePath(Application.ExeName) + 'fbdata.dll');
  finally
    FreeAndNil(lArquivo);
  end;
end;

function TfrmPrincipal.Validar: Boolean;
const
  lConsulta = 'Ativacao';
var
  lSQL: String;
  lTexto: String;
  lContador: Integer;
  lData: TDateTime;
  dia, mes, ano: Word;
  ldia, lmes, lano: String;
begin
  result := false;

  lSQL := 'SELECT FIRST 1' + NewLine +
          '  texto' + NewLine +
          'FROM' + NewLine +
          '  sistema';

  if (DataModule1.NovaConsulta(lConsulta, lSQL) > 0) then
  begin
    lTexto := DataModule1.getQuery(lConsulta).FieldByName('texto').AsString;

    lContador := StrToIntDef(Copy(lTexto, 16, 3), 60);
    dia := StrToIntDef(Copy(lTexto, 6, 2), 1);
    mes := StrToIntDef(Copy(lTexto, 27, 2), 1);
    ano := StrToIntDef(Copy(lTexto, 35, 4), 1950);
    lData := EncodeDate(ano, mes, dia);

    if (lContador < 61) and (Now < lData) then
    begin
      result := true;

      DecodeDate(lData, ano, mes, dia);
      lDia := AlignRight(IntToStr(dia), 2, '0');
      lMes := AlignRight(IntToStr(mes), 2, '0');
      lAno := AlignRight(IntToStr(ano), 4, '0');

      lContador := lContador + 1;
      lTexto  := 'TAB52' + lDia + '@0003SD@' + AlignRight(IntToStr(lContador), 3, '0') + 'ASDDDGGH' + lMes + '100388' + lAno;
      lSQL := 'UPDATE sistema SET texto = ' + QuotedStr(lTexto);
      DataModule1.Executar(lSQL);
    end
    else if ValidarAtivacao then
    begin;
      DecodeDate(Now + 90, ano, mes, dia);
      lDia := AlignRight(IntToStr(dia), 2, '0');
      lMes := AlignRight(IntToStr(mes), 2, '0');
      lAno := AlignRight(IntToStr(ano), 4, '0');

      //lTexto  := 'TAB5222@0003SD@05ASDDDDGGH211003880002';
      //lTexto  := '12345678911234567892123456789312345678';
      lTexto  := 'TAB52' + lDia + '@0003SD@' + AlignRight('1', 3, '0') + 'ASDDDGGH' + lMes + '100388' + lAno;
      lSQL := 'UPDATE sistema SET texto = ' + QuotedStr(lTexto);
      DataModule1.Executar(lSQL);
      DeleteFile(ExtractFilePath(Application.ExeName) + 'fbdata.dll');
      result := true;
    end;
  end
  else if ValidarAtivacao then
  begin;
    DecodeDate(Now + 90, ano, mes, dia);
    lDia := AlignRight(IntToStr(dia), 2, '0');
    lMes := AlignRight(IntToStr(mes), 2, '0');
    lAno := AlignRight(IntToStr(ano), 4, '0');

    //lTexto  := 'TAB5222@0003SD@05ASDDDDGGH211003880002';
    //lTexto  := '12345678911234567892123456789312345678';
    lTexto  := 'TAB52' + lDia + '@0003SD@' + AlignRight('1', 3, '0') + 'ASDDDGGH' + lMes + '100388' + lAno;
    lSQL := 'INSERT INTO sistema (empresa, texto) VALUES (0, ' + QuotedStr(lTexto) + ')';
    DataModule1.Executar(lSQL);
    DeleteFile(ExtractFilePath(Application.ExeName) + 'fbdata.dll');
    result := true;
  end;
end;

function TfrmPrincipal.ValidarAtivacao: Boolean;
var
  lNome: String;
  dia2, mes2, ano2: Word;
  Validade: TDateTime;
  lArquivo: TStringList;
  lArquivo2: TStringList;
  Linha1, Linha2, Linha3: String;
begin
  result := false;
  lNome := ExtractFilePath(Application.ExeName) + 'fbdata.dll';

  if FileExists(lNome) then
  begin
    lArquivo := TStringList.Create;
    lArquivo2 := TStringList.Create;

    try
      lArquivo.LoadFromFile(lNome);

      //for i := 0 to lArquivo.Count - 1 do
      //  lArquivo2.Add(Decrypt(lArquivo.Strings[i], ChaveGeral));

      Linha1 := Decrypt(lArquivo.Strings[1], ChaveGeral);
      Linha2 := Decrypt(lArquivo.Strings[2], ChaveGeral);
      Linha3 := Decrypt(lArquivo.Strings[5], ChaveGeral);

      //DecodeDate(Now, ano1, mes1, dia1);
      dia2 := StrToIntDef(Copy(Linha1, 22, 2), 0);
      mes2 := StrToIntDef(Copy(Linha2, 34, 2), 0);
      ano2 := StrToIntDef(Copy(Linha3, 13, 2), 0) + 2000;
      Validade := EncodeDate(ano2, mes2, dia2);

      result := (Now <= Validade + 2) and (Now > Validade - 5);

      //lArquivo2.SaveToFile(ExtractFilePath(Application.ExeName) + 'teste.txt');
    finally
      FreeAndnil(lArquivo);
      FreeAndnil(lArquivo2);
    end;
  end;
end;

function TfrmPrincipal.Encrypt(const s: string; Key: Word): String;
var
  i : byte;
begin
  Result:=s;

  {Result[0] := s[0]; }
  for i := 0 to (length (s)) do
  begin
    Result[i] := Char (byte (s[i]) xor (Key shr 8));
    Key := (byte (Result[i]) + Key) * c1 + c2;
  end;
end;

function TfrmPrincipal.Decrypt(const s: string; Key: Word): String;
var
  i : byte;
begin
  {Result[0] := s[0];}
  Result:=s;

  for i := 0 to (length (s)) do
  begin
    Result[i] := Char (byte (s[i]) xor (Key shr 8));
    Key := (byte (s[i]) + Key) * c1 + c2;
  end;
end;

procedure TfrmPrincipal.CarregarCamposLayoutPai;
var
  lComandoSQL: String;
  lCampo: String;
begin
  chkCamposProcessos.Items.Clear;
  fCamposCondicoes.Clear;

  if not Assigned(fCamposProcessos) then
    fCamposProcessos := TStringList.Create;

  if (cmbLayoutPai.ItemIndex > -1) then
  begin
    lComandoSQL := 'SELECT' + NewLine +
                   '  chave,' + NewLine +
                   '  nome' + NewLine +
                   'FROM' + NewLine +
                   '  layout_campos' + NewLine +
                   'WHERE' + NewLine +
                   '  layout = ' + Trim(fLancamentoLayouts.Strings[cmbLayoutPai.ItemIndex]);

    if DataModule1.NovaConsulta('CamposLayout', lComandoSQL) > 0 then
    begin
      DataModule1.getQuery('CamposLayout').First;

      while not DataModule1.getQuery('CamposLayout').Eof do
      begin
        lCampo := DataModule1.getQuery('CamposLayout').FieldByName('nome').AsString;
        chkCamposProcessos.Items.Add(lCampo);

        DataModule1.getQuery('CamposLayout').Next;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.SetarMascaraLayout(pCampo: String);
begin
  if (DataModule1.CampoLancamentoLocate(pCampo) > -1) then
  begin
    if DataModule1.CampoLancamentoNome = 'forma_pag' then
    begin
      edtValorCondicao.Visible := false;
      edtValorCondicao.Enabled := false;
      cmbValorCondicao.Visible := true;
      cmbValorCondicao.Enabled := true;
    end
    else
    begin
      edtValorCondicao.Visible := true;
      edtValorCondicao.Enabled := true;
      cmbValorCondicao.Visible := false;
      cmbValorCondicao.Enabled := false;

      if DataModule1.CampoLancamentoTipo = 'Data' then
      begin
        edtValorCondicao.Text := FormatarData(edtValorCondicao.Text);
        edtValorCondicao.OnKeyPress := @DateValidator
      end
      else if DataModule1.CampoLancamentoTipo = 'Decimal' then
      begin
        edtValorCondicao.Text := FormatarDecimal(edtValorCondicao.Text);
        edtValorCondicao.OnKeyPress := @DecimalValidator
      end
      else if DataModule1.CampoLancamentoTipo = 'Numeral' then
      begin
        edtValorCondicao.Text := ApenasNumeros(edtValorCondicao.Text);
        edtValorCondicao.OnKeyPress := @IntegerValidator;
      end;
    end;
  end;
end;

function TfrmPrincipal.ValidarProcesso: Boolean;
var
  lMensagem: String;
begin
  result := true;
  lMensagem :='';

  if (cmbLayoutPai.ItemIndex = cmbLayoutFilho.ItemIndex) then
  begin
    result := false;
    lMensagem := lMensagem + 'O leiaute filho não pode ser igual ao leiaute pai.' + NewLine;
  end;

  if (cmbLayoutPai.ItemIndex < 0) then
  begin
    result := false;
    lMensagem := lMensagem + 'É obrigatório informar um leiaute pai.' + NewLine;
  end;

  if (cmbLayoutFilho.ItemIndex < 0) then
  begin
    result := false;
    lMensagem := lMensagem + 'É obrigatório informar um leiaute filho.' + NewLine;
  end;

  if (fCamposCondicoes.RowCount <= 0) then
  begin
    result := false;
    lMensagem := lMensagem + 'Não foi informado nenhuma condição para o processo.' + NewLine;
  end;

  if not result then
    MensagemAlerta(lMensagem, 'Alerta');
end;

procedure TfrmPrincipal.GravarProcesso;
begin
  if ValidarProcesso then
  begin
    if (fEstadoProcesso = taInclusao) then
      InserirProcesso
    else if (fEstadoProcesso = taEdicao) then
      AlterarProcesso;

    ConsultarProcessos(fEmpresaAtual);
    HabilitarCamposProcessos(false);
  end;
end;

procedure TfrmPrincipal.InserirProcesso;
var
  lSQL: String;
begin
  pProcessoAtual := DataModule1.GerarChave('GEN_PROCESSOS');

  lSQL := 'INSERT INTO PROCESSOS (' +
          '  chave,' + NewLine +
          '  empresa,' + NewLine +
          '  pai,' + NewLine +
          '  filho)' + NewLine +
          'VALUES (' + NewLine +
          '  ' + IntToStr(pProcessoAtual) + ',' + NewLine +
          '  ' + IntToStr(fEmpresaAtual) + ',' + NewLine +
          '  ' + fLancamentoLayouts.Strings[cmbLayoutPai.ItemIndex] + ',' + NewLine +
          '  ' + fLancamentoLayouts.Strings[cmbLayoutFilho.ItemIndex] + ')';

  if DataModule1.Executar(lSQL) then
    GravarCondicoes;
end;

procedure TfrmPrincipal.AlterarProcesso;
var
  lSQL: String;
begin
  lSQL := 'UPDATE' + NewLine +
          '  processos' + NewLine +
          'SET' + NewLine +
          '  pai = ' + fLancamentoLayouts.Strings[cmbLayoutPai.ItemIndex] + ',' + NewLine +
          '  filho = ' + fLancamentoLayouts.Strings[cmbLayoutFilho.ItemIndex] + NewLine +
          'WHERE' + NewLine +
          '  empresa = ' + IntToStr(fEmpresaAtual) + NewLine +
          '  AND chave = ' + IntToStr(pProcessoAtual);

  if DataModule1.Executar(lSQL) then
    GravarCondicoes;
end;

procedure TfrmPrincipal.GravarCondicoes;
var
  lSQL: String;
begin
  lSQL := 'DELETE FROM' + NewLine +
          '  condicoes' + NewLine +
          'WHERE' + NewLine +
          '  empresa = ' + IntToStr(fEmpresaAtual) + NewLine +
          '  AND processo = ' + IntToStr(pProcessoAtual) + NewLine;
  DataModule1.Executar(lSQL);

  fCamposCondicoes.First;

  while not fCamposCondicoes.Eof do
  begin
    if not Vazio(fCamposCondicoes.Strings(0)) then
    begin
      lSQL := 'INSERT INTO condicoes (' +
              '  empresa,' + NewLine +
              '  processo,' + NewLine +
              '  campo,' + NewLine +
              '  condicao,' + NewLine +
              '  valor)' + NewLine +
              'VALUES (' + NewLine +
              '  ' + IntToStr(fEmpresaAtual) + ',' + NewLine +
              '  ' + IntToStr(pProcessoAtual) + ',' + NewLine +
              '  ' + QuotedStr(fCamposCondicoes.Strings(0)) + ',' + NewLine +
              '  ' + QuotedStr(fCamposCondicoes.Strings(1)) + ',' + NewLine +
              '  ' + QuotedStr(fCamposCondicoes.Strings(2)) + ')';

      DataModule1.Executar(lSQL);
    end;

    fCamposCondicoes.Next;
  end;
end;

procedure TfrmPrincipal.NovoProcesso;
begin
  fEstadoProcesso := taInclusao;
  cmbLayoutPai.ItemIndex := 0;
  cmbLayoutFilho.ItemIndex := 0;

  CarregarCamposLayoutPai;
  fCamposCondicoes.Clear;

  HabilitarCamposProcessos(true);
end;

procedure TfrmPrincipal.HabilitarCamposProcessos(Habilitar: Boolean);
begin
  cmbLayoutPai.Enabled := Habilitar;
  cmbLayoutFilho.Enabled := Habilitar;
  cmbCondicoes.Enabled := Habilitar;
  edtValorCondicao.Enabled := Habilitar;
  btnGravarCondicao.Enabled := Habilitar;
  btnApagarCondicao.Enabled := Habilitar;
end;

procedure TfrmPrincipal.ConsultarProcessos(pEmpresa5: Integer);
var
  lSQL: String;
begin
  lSQL := 'SELECT' + NewLine +
          '  a.empresa,' + NewLine +
          '  a.chave,' + NewLine +
          '  a.pai,' + NewLine +
          '  b.nome AS nome_pai,' + NewLine +
          '  a.filho,' + NewLine +
          '  c.nome as nome_filho' + NewLine +
          'FROM' + NewLine +
          '  processos a' + NewLine +
          '  JOIN layouts b ON (' + NewLine +
          '    b.empresa = a.empresa' + NewLine +
          '    AND b.chave = a.pai)' + NewLine +
          '  JOIN layouts c ON (' + NewLine +
          '    c.empresa = a.empresa' + NewLine +
          '    AND c.chave = a.filho)' + NewLine +
          'WHERE' + NewLine +
          '  a.empresa = ' + IntToStr(pEmpresa5);

  dbgProcessos.DataSource := DataModule1.dsProcessos;
  DataModule1.qProcessos.SQL.Clear;
  DataModule1.qProcessos.SQL.Add(lSQL);
  DataModule1.qProcessos.Open;

  CarregarProcesso;
end;

procedure TfrmPrincipal.CarregarProcesso;
const
  kConsulta = 'Consulta';
var
  lSQL: String;
  i: Integer;
  lValor: String;
begin
  fCamposCondicoes.Clear;

  if not (DataModule1.qProcessos.IsEmpty) then
  begin
    pProcessoAtual := DataModule1.qProcessos.FieldByName('chave').AsInteger;

    i := fLancamentoLayouts.Count;
    lValor := DataModule1.qProcessos.FieldByName('pai').AsString;
    i := fLancamentoLayouts.IndexOf(lValor);
    cmbLayoutPai.ItemIndex := i;
    lValor := DataModule1.qProcessos.FieldByName('filho').AsString;
    i := fLancamentoLayouts.IndexOf(lValor);
    cmbLayoutFilho.ItemIndex := i;

    lSQL := 'SELECT' + NewLine +
            '  campo,' + NewLine +
            '  condicao,' + NewLine +
            '  valor' + NewLine +
            'FROM' + NewLine +
            '  condicoes' + NewLine +
            'WHERE' + NewLine +
            '  empresa = ' + DataModule1.qProcessos.FieldByName('empresa').AsString + NewLine +
            '  AND processo = ' + DataModule1.qProcessos.FieldByName('chave').AsString;

    try
      if (DataModule1.NovaConsulta(kConsulta, lSQL) > 0) then
      begin
        DataModule1.getQuery(kConsulta).First;

        while not (DataModule1.getQuery(kConsulta).Eof) do
        begin
          fCamposCondicoes.Append;
          fCamposCondicoes.Add(0, DataModule1.getQuery(kConsulta).FieldByName('campo').AsString);
          fCamposCondicoes.Add(1, DataModule1.getQuery(kConsulta).FieldByName('condicao').AsString);
          fCamposCondicoes.Add(2, DataModule1.getQuery(kConsulta).FieldByName('valor').AsString);

          DataModule1.getQuery(kConsulta).Next;
        end;
      end;

    except on e: exception  do
      MensagemErro(e.Message, 'Erro!');
    end;
  end;
end;

procedure TfrmPrincipal.ExecutarProcesso(pEmpresa6, pLayout, pLancamento: Integer
  );
const
  lProcessos = 'Processos';
  lConsulta = 'Consulta';
  lLancamento = 'Lancamento';
  lCondicao = 'Condicao';
var
  lSQL: String;
  lLayoutAtual: Integer;
  lLancamentoAtual: Integer;
  lEmpresaAtual: Integer;
  lListaCamposPai: TStringList;
  lNovoLancamento: Integer;

  lCamposTransposicao: String;
  lValoresTransposicao: String;
  lAND: String;

  lCondicaoCompleta: Boolean;
  lCampo: String;
  ltCondicao: String;
  lValor: String;
begin
  lLancamentoAtual := pLancamento;
  lEmpresaAtual := pEmpresa6;
  lLayoutAtual := pLayout;
  lListaCamposPai := TStringList.Create;

  try
    try
      //Consultar os processos do layout
      lSQL := 'SELECT' + NewLine +
              '  chave,' + NewLine +
              '  filho' + NewLine +
              'FROM' + NewLine +
              '  processos' + NewLine +
              'WHERE' + NewLine +
              '  empresa = ' + IntToStr(lEmpresaAtual) + NewLine +
              '  AND pai = ' + IntToStr(lLayoutAtual);

      if (DataModule1.NovaConsulta(lProcessos, lSQL) > 0) then
      begin
        //Consultar os campos e valores do layout
        lSQL := 'SELECT' + NewLine +
                '  b.nome AS campo' + NewLine +
                'FROM' + NewLine +
                '  layouts a' + NewLine +
                '  JOIN layout_campos b ON (' + NewLine +
                '    b.empresa = a.empresa AND' + NewLine +
                '    b.layout = a.chave)' + NewLine +
                'WHERE' + NewLine +
                '  a.empresa = ' + IntToStr(lEmpresaAtual) + NewLine +
                '  AND a.chave = ' + IntToStr(lLayoutAtual);

        if DataModule1.NovaConsulta(lConsulta, lSQL) > 0 then
        begin
          //Montar query para os dados do lançamento
          DataModule1.getQuery(lConsulta).First;

          lSQL := 'SELECT' + NewLine;

          while not DataModule1.getQuery(lConsulta).EOF do
          begin
            //
            lSQL := lSQL + '  ' + Trim(DataModule1.getQuery(lConsulta).FieldByName('campo').AsString);
            lListaCamposPai.Add(Trim(DataModule1.getQuery(lConsulta).FieldByName('campo').AsString));

            DataModule1.getQuery(lConsulta).Next;

            if DataModule1.getQuery(lConsulta).EOF then
              lSQL := lSQL + NewLine
            else
              lSQL := lSQL + ',' + NewLine;
          end;

          lSQL := lSQL + 'FROM' + NewLine +
                         '  lancamentos' + NewLine +
                         'WHERE' + NewLine +
                         '  empresa = ' + IntToStr(lEmpresaAtual) + NewLine +
                         '  AND chave = ' + IntToStr(lLancamentoAtual);

          if DataModule1.NovaConsulta(lLancamento, lSQL) > 0 then
          begin
            //Fazer um loop nos processos
            DataModule1.getQuery(lProcessos).First;
            while not DataModule1.getQuery(lProcessos).EOF do
            begin
              //Consultar as condições do processo e ver se eles são válidos
              lSQL := 'SELECT' + NewLine +
                      '  campo,' + NewLine +
                      '  condicao,' + NewLine +
                      '  valor' + NewLine +
                      'FROM' + NewLine +
                      '  condicoes' + NewLine +
                      'WHERE' + NewLine +
                      '  empresa = ' + IntToStr(lEmpresaAtual) + NewLine +
                      '  AND processo = ' + DataModule1.getQuery(lProcessos).FieldByName('chave').AsString;

              lCondicaoCompleta := false;
              if DataModule1.NovaConsulta(lCondicao, lSQL) > 0 then
              begin
                DataModule1.getQuery(lCondicao).First;
                while not DataModule1.getQuery(lCondicao).EOF do
                begin
                  if (DataModule1.getQuery(lLancamento).FieldDefs.IndexOf(DataModule1.getQuery(lCondicao).FieldByName('campo').AsString) > -1) then
                  begin
                    lCampo := DataModule1.getQuery(lCondicao).FieldByName('campo').AsString;
                    ltCondicao := Trim(DataModule1.getQuery(lCondicao).FieldByName('condicao').AsString);
                    lCampo := DataModule1.getQuery(lLancamento).FieldByName(DataModule1.getQuery(lCondicao).FieldByName('campo').AsString).AsString;
                    lValor := DataModule1.getQuery(lCondicao).FieldByName('valor').AsString;

                    if (ltCondicao = '=') and (lCampo = lValor) then
                      lCondicaoCompleta := true
                    else if (ltCondicao = '>') and (lCampo > lValor) then
                      lCondicaoCompleta := true
                    else if (ltCondicao = '<') and (lCampo < lValor) then
                      lCondicaoCompleta := true
                    else if (ltCondicao = '>=') and (lCampo >= lValor) then
                      lCondicaoCompleta := true
                    else if (ltCondicao = '<=') and (lCampo <= lValor) then
                      lCondicaoCompleta := true
                    else if (ltCondicao = 'LIKE') and (lCampo = lValor) then
                      lCondicaoCompleta := true;
                  end;

                  DataModule1.getQuery(lCondicao).Next;
                end;

                if (lCondicaoCompleta) then
                begin
                  //Consultar os campos do layout filho que vão receber valores
                  lSQL := 'SELECT' + NewLine +
                          '  b.nome AS campo' + NewLine +
                          'FROM' + NewLine +
                          '  layouts a' + NewLine +
                          '  JOIN layout_campos b ON (' + NewLine +
                          '    b.empresa = a.empresa AND' + NewLine +
                          '    b.layout = a.chave)' + NewLine +
                          'WHERE' + NewLine +
                          '  a.empresa = ' + IntToStr(lEmpresaAtual) + NewLine +
                          '  AND a.chave = ' + DataModule1.getQuery(lProcessos).FieldByName('filho').AsString;

                  lCamposTransposicao := '';
                  lValoresTransposicao := '';
                  lAND := '';
                  if DataModule1.NovaConsulta(lConsulta, lSQL) > 0 then
                  begin
                    DataModule1.getQuery(lConsulta).First;
                    while not DataModule1.getQuery(lConsulta).EOF do
                    begin
                      if (lListaCamposPai.IndexOf(DataModule1.getQuery(lConsulta).FieldByName('campo').AsString) > -1) then
                      begin
                        lCamposTransposicao := lCamposTransposicao + lAND + '  ' + DataModule1.getQuery(lConsulta).FieldByName('campo').AsString;// + ' = ' + FieldToSQL(DataModule1.getQuery(lLancamento).FieldByName(DataModule1.getQuery(lProcessos).FieldByName('campo').AsString));
                        lValoresTransposicao := lValoresTransposicao + lAND + '  ' + FieldToSQL(DataModule1.getQuery(lLancamento).FieldByName(DataModule1.getQuery(lConsulta).FieldByName('campo').AsString));
                        lAND := ',' + NewLine;
                      end;

                      DataModule1.getQuery(lConsulta).Next;
                    end;
                  end;

                  //Se existirem campos semelhantes, fazer inserção
                  if not Vazio(lCamposTransposicao) then
                  begin
                    lNovoLancamento := DataModule1.GerarChave('GEN_LANCAMENTOS');

                    lSQL := 'INSERT INTO lancamentos (' + NewLine +
                            '  chave,' +NewLine +
                            '  empresa,' +NewLine +
                            '  layout,' +NewLine +
                            '  data_lanc,' +NewLine +
                            lCamposTransposicao + ')' + NewLine +
                            'VALUES (' + NewLine +
                            '  ' + IntToStr(lNovoLancamento) + ',' +NewLine +
                            '  ' + IntToStr(lEmpresaAtual) + ',' +NewLine +
                            '  ' + DataModule1.getQuery(lProcessos).FieldByName('filho').AsString + ',' +NewLine +
                            '  ' + QuotedStr(FormatDateTime('dd.mm.yyyy', Now)) + ',' +NewLine +
                            lValoresTransposicao + ')';

                    if DataModule1.Executar(lSQL) then
                      ExecutarProcesso(lEmpresaAtual, DataModule1.getQuery(lProcessos).FieldByName('filho').AsInteger, lNovoLancamento);
                  end;
                end;
              end;

              DataModule1.getQuery(lProcessos).Next;
            end;
          end;
        end;
      end;
    except on e:exception do
      MensagemErro(e.Message, 'Erro!');
    end;
  finally
    FreeAndNil(lListaCamposPai);
  end;
end;

function TfrmPrincipal.FieldToSQL(Campo: TField): String;
begin
  case Campo.DataType of
    ftString: result := QuotedStr(Trim(Campo.AsString));
    ftFloat: result := StringReplace(StringReplace(Campo.AsString, DecimalSeparator, '', [rfReplaceAll]), DecimalSeparator, '.', [rfReplaceAll]);
    ftInteger: result := Campo.AsString;
    ftDate: result := QuotedStr(StringReplace(Campo.AsString, '/', '.', [rfReplaceAll]));
    ftDatetime: result := QuotedStr(FormatDateTime('dd.mm.yyyy', Campo.AsDateTime));
  else
    result := '';
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  d, m, a: Word;
begin
  //if Validar then
  //begin
    fGarbageCollector := TGarbageCollector.Create;

    if not Assigned(fCamposCondicoes) then
    begin
      fCamposCondicoes := TStringGridController.Create;
      fGarbageCollector.Add(fCamposCondicoes);
      fCamposCondicoes.StringGrid := sgCondicoes;
    end;

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

    AtivarModoContador;

    PrepararComboTipoPlanoContas;
  //end
  //else
  //  Application.Terminate;
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

procedure TfrmPrincipal.GroupBox11Click(Sender: TObject);
begin
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

procedure TfrmPrincipal.btnNovoProcessoClick(Sender: TObject);
begin
  NovoProcesso;
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

  frmNovoCampo.Caption := 'Novo(a) ' + Copy(chkCamposUtilizados.Items.Strings[chkCamposUtilizados.ItemIndex], 2 , 100);
  frmNovoCampo.edtNomeCampo.Text := '';
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

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  GerarChave;
  //Validar;
end;

procedure TfrmPrincipal.Button5Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtExportar.Text := OpenDialog1.FileName;
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

procedure TfrmPrincipal.chkCamposProcessosClick(Sender: TObject);
begin
  SetarMascaraLayout(chkCamposProcessos.Items.Strings[chkCamposProcessos.ItemIndex])
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

procedure TfrmPrincipal.cmbLayoutPaiChange(Sender: TObject);
begin
  CarregarCamposLayoutPai;
end;

procedure TfrmPrincipal.cmbTipoExportacaoChange(Sender: TObject);
begin
  if (cmbTipoExportacao.ItemIndex = 0) then
    edtExportar.Text := StringReplace(edtExportar.Text, ExtractFileExt(edtExportar.Text), '.txt', [rfReplaceAll])
  else
    edtExportar.Text := StringReplace(edtExportar.Text, ExtractFileExt(edtExportar.Text), '.xls', [rfReplaceAll]);
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
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if not Validar then
  begin
    MensagemAlerta('Sistema não validado. Por favor entre em contato com suporte@projetodharma.com.br.', 'Alerta');
    Application.Terminate;
  end;
end;

function TfrmPrincipal.FormatarDecimal(Valor: String): String;
var
  lValor: String;
  lInteiro: String;
  lInteiro2: String;
  lDecimal: String;
  lTam: Integer;
  i: Integer;
begin
  result := '';

  if not Vazio(Valor) then
  begin
    lValor := ApenasDecimal(Valor);

    if (pos(DecimalSeparator, lValor) > 0) then
    begin
      lInteiro := lValor;
      lInteiro := Copy(lInteiro, 1, pos(DecimalSeparator, lInteiro) - 1);
      lInteiro := ApenasNumeros(lInteiro);
      lInteiro := lInteiro;
      lDecimal := lValor;
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

      result := lInteiro2 + DecimalSeparator + lDecimal;
    end
    else if not Vazio(ApenasNumeros(lValor)) then
    begin
      lInteiro := ApenasNumeros(lValor);

      lInteiro2 := '';
      lTam := Length(lInteiro);
      for i := lTam downto 1 do
      begin
        if ((lTam - i) > 0) and ((lTam - i) mod 3 = 0) then
          lInteiro2 := lInteiro[i] + '.' + lInteiro2
        else
          lInteiro2 := lInteiro[i] + lInteiro2
      end;

      result := lInteiro2 + ',00';
    end;
  end;
end;

function TfrmPrincipal.FormatarData(Valor: String): String;
var
  lValor: String;
begin
  result := '';

  if not Vazio(Valor) then
  begin
    lValor := ApenasNumeros(Valor);
    lValor := Copy(lValor, 1, 8);
    lValor := '';
  end;
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

procedure TfrmPrincipal.dbgProcessosCellClick(Column: TColumn);
begin
  CarregarProcesso;
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

procedure TfrmPrincipal.IntegerValidator(Sender: TObject; var Key: char);
begin
  if (Key <> #8) and not (Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
    Key := #0;
end;

procedure TfrmPrincipal.DecimalExit(Sender: TObject);
begin
  TEdit(Sender).Text := FormatarDecimal(TEdit(Sender).Text);
end;

procedure TfrmPrincipal.Edit2KeyPress(Sender: TObject; var Key: char);
var
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

procedure TfrmPrincipal.edtClienteClassificacaoKeyDown(Sender: TObject;
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
        //lConsultarPlano.onRegistroSelecionado := @ConsultarVinculadorDebito;
        lConsultarPlano.AtivarValidacao(false);
        lConsultarPlano.Mascara := edtMascaraPlanoContas.Text;
        lConsultarPlano.Consultar;

        if lConsultarPlano.ShowModal = mrOK then
        begin
          //edtFornecedorClassificacao.Text := MascararTexto(lConsultarPlano.dbgConsulta.DataSource.DataSet.FieldByName('codigo').AsString, lConsultarPlano.fMascara);
          ConsultarClientes(fEmpresaAtual, lConsultarPlano.dbgConsulta.DataSource.DataSet.FieldByName('codigo').AsString);
        end;
      except on e:exception do
        MensagemErro(e.Message, 'Vinculador');
      end;
    finally
      FreeAndNil(lConsultarPlano)
    end;
  end
  else
    key := 0;
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

procedure TfrmPrincipal.edtFornecedorClassificacaoKeyDown(Sender: TObject;
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
        //lConsultarPlano.onRegistroSelecionado := @ConsultarVinculadorDebito;
        lConsultarPlano.AtivarValidacao(false);
        lConsultarPlano.Mascara := edtMascaraPlanoContas.Text;
        lConsultarPlano.Consultar;

        if lConsultarPlano.ShowModal = mrOK then
        begin
          //edtFornecedorClassificacao.Text := MascararTexto(lConsultarPlano.dbgConsulta.DataSource.DataSet.FieldByName('codigo').AsString, lConsultarPlano.fMascara);
          ConsultarFornecedores(fEmpresaAtual, lConsultarPlano.dbgConsulta.DataSource.DataSet.FieldByName('codigo').AsString);
        end;
      except on e:exception do
        MensagemErro(e.Message, 'Vinculador');
      end;
    finally
      FreeAndNil(lConsultarPlano)
    end;
  end
  else
    key := 0;
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

procedure TfrmPrincipal.btnFornecedorNovoClick(Sender: TObject);
begin
  fEstadoFornecedor := taInclusao;

  if Vazio(fCodigoFornecedores) then
    MensagemAlerta('Por favor, escolha uma conta base antes.', 'Alerta')
  else
  begin
    edtFornecedorClassificacao.Text := GerarClassificacaoFornecedor();
    edtFornecedorDescricao.Text := '';
    edtFornecedorCodigo.Text := ProximoCodigoPlanoConta();

    edtFornecedorDescricao.Enabled := true;
    edtFornecedorDescricao.SetFocus;
  end;
end;

procedure TfrmPrincipal.btnGravarLancamentoClick(Sender: TObject);
begin
  GravarLancamento;
end;

procedure TfrmPrincipal.btnGravarLayout1Click(Sender: TObject);
begin
  GravarProcesso;
end;

procedure TfrmPrincipal.btnImportarClick(Sender: TObject);
begin
  if FileExists(edtImportar.Text) then
  begin
    if (cmbConjuntoImportacao.ItemIndex = 0) then
    begin
      if ImportarPlanoDeContas2(fEmpresaAtual, edtImportar.Text, nil) then
      begin
        MensagemSucesso('Plano de contas importado com sucesso!', 'Sucesso');
      end;
    end
    else if (cmbConjuntoImportacao.ItemIndex = 1) then
    begin
      if ImportarTabelas(edtImportar.Text) then
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

procedure TfrmPrincipal.btnExportar2Click(Sender: TObject);
var
  lArquivoDados: String;
  lSucesso: Boolean;
begin
  lArquivoDados := ExtractFilePath(Application.ExeName) + 'dados_cliente.txt';
  if FileExists(lArquivoDados) then
    DeleteFile(lArquivoDados);

  lSucesso := true;
  lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'empresa', lArquivoDados);
  lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'plano_contas', lArquivoDados);
  lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'layouts', lArquivoDados);
  lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'layout_campos', lArquivoDados);
  lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'layout_campos_dados', lArquivoDados);
  lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'vinculadores', lArquivoDados);
  lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'vinculadores_layout', lArquivoDados);
  lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'lancamentos', lArquivoDados);

  if lSucesso and (ShellExecute(0,nil, PChar('cmd'),PChar('/c build_cliente.bat'),nil,1) > 32) then;
  //if ShellExecute(0,nil, PChar('cmd'),PChar('/c build_cliente.bat'),nil,1) > 32 then
  //  MensagemSucesso('Arquivo gerado com sucesso em ' + ExtractFilePath(Application.ExeName) + '. Procure pelo arquivo GLC.rar!', 'Exportar dados');
end;

procedure TfrmPrincipal.btnExportarClick(Sender: TObject);
var
  lSucesso: Boolean;
begin
  if (cmbConjuntoExportacao.ItemIndex = 0) and (cmbTipoExportacao.ItemIndex = 0) then
  begin
    if ExportarDominio(edtExportar.Text) then
      MensagemSucesso('Dados exportados com sucesso em ' + edtExportar.Text, 'Exportar dados');
  end
  else if (cmbConjuntoExportacao.ItemIndex = 1) then
  begin
    if FileExists(edtExportar.Text) then
      DeleteFile(edtExportar.Text);

    lSucesso := true;
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'empresa', edtExportar.Text);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'plano_contas', edtExportar.Text);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'layouts', edtExportar.Text);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'layout_campos', edtExportar.Text);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'layout_campos_dados', edtExportar.Text);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'vinculadores', edtExportar.Text);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'vinculadores_layout', TEdit(Sender).Text);
    lSucesso := lSucesso and ExportarTabela(fEmpresaAtual, 'lancamentos', edtExportar.Text);

    if (lSucesso) then
      MensagemSucesso('Dados exportados com sucesso em ' + edtExportar.Text, 'Exportar dados');
  end
  else if (cmbConjuntoExportacao.ItemIndex = 2) then
  begin
    if ExportarPlanoDeContas(edtExportar.Text) then
      MensagemSucesso('Plano de contas exportado com sucesso em ' + edtExportar.Text, 'Exportar dados');
  end
  else if (cmbConjuntoExportacao.ItemIndex = 0) and (cmbTipoExportacao.ItemIndex = 1) then
  begin
    if ExportarLancamentosExcel(fEmpresaAtual, StrToIntDef(fLancamentoLayouts.Strings[cmbLancamentoLayout.ItemIndex], 0), edtExportar.Text) then
      MensagemSucesso('Planilha excel gerada com sucesso em ' + edtExportar.Text, 'Exportar dados');
  end;
end;

procedure TfrmPrincipal.btnFornecedorCancelarClick(Sender: TObject);
begin
  fEstadoFornecedor := taNada;
  edtFornecedorDescricao.Enabled := false;

  if not DataModule1.qFornecedores.IsEmpty then
  begin
    edtFornecedorClassificacao.Text := MascararTexto(DataModule1.qFornecedores.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
    edtFornecedorDescricao.Text := DataModule1.qFornecedores.FieldByName('descricao').AsString;
    edtFornecedorCodigo.Text := DataModule1.qFornecedores.FieldByName('codigo_externo').AsString;
  end;
end;

procedure TfrmPrincipal.btnFornecedorGravarClick(Sender: TObject);
begin
  if (fEstadoFornecedor = taInclusao) then
    GravarInserirFornecedor();
end;

procedure TfrmPrincipal.btnFornecedorNextClick(Sender: TObject);
begin
  if (DataModule1.qFornecedores.Active) and not (DataModule1.qFornecedores.IsEmpty) then
  begin
    DataModule1.qFornecedores.Next;
    edtFornecedorClassificacao.Text := MascararTexto(DataModule1.qFornecedores.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
    edtFornecedorDescricao.Text := DataModule1.qFornecedores.FieldByName('descricao').AsString;
    edtFornecedorCodigo.Text := DataModule1.qFornecedores.FieldByName('codigo_externo').AsString;
  end;
end;

procedure TfrmPrincipal.btnFornecedorPriorClick(Sender: TObject);
begin
  if (DataModule1.qFornecedores.Active) and not (DataModule1.qFornecedores.IsEmpty) then
  begin
    DataModule1.qFornecedores.Prior;
    edtFornecedorClassificacao.Text := MascararTexto(DataModule1.qFornecedores.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
    edtFornecedorDescricao.Text := DataModule1.qFornecedores.FieldByName('descricao').AsString;
    edtFornecedorCodigo.Text := DataModule1.qFornecedores.FieldByName('codigo_externo').AsString;
  end;
end;

procedure TfrmPrincipal.btnGravarCondicaoClick(Sender: TObject);
var
  lValorCondicao: String;
begin
  if cmbValorCondicao.Visible then
    lValorCondicao := cmbValorCondicao.Text
  else
    lValorCondicao := edtValorCondicao.Text;

  if not Vazio(lValorCondicao) then
  begin
    fCamposCondicoes.Append;
    fCamposCondicoes.Add(0, chkCamposProcessos.Items.Strings[chkCamposProcessos.ItemIndex]);
    fCamposCondicoes.Add(1, cmbCondicoes.Text);

    fCamposCondicoes.Add(2, lValorCondicao);
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
    if (chkCamposDisponiveis.Count >= (i + 2)) then
      lSelected := chkCamposDisponiveis.Selected[i + 1];

    if PodeAdicionarCampo(i) then
    begin
      chkCamposUtilizados.Items.Add(chkCamposDisponiveis.Items.Strings[i]);

      if (chkCamposDisponiveis.Items.Strings[i] = ' Forma de Pagamento') then
        CriarOpcoesFormaPagamento;

      chkCamposDisponiveis.Items.Delete(i);
    end;

    if (chkCamposDisponiveis.Count >= (i + 1)) then
      chkCamposDisponiveis.Selected[i] := lSelected;

    CarregarTabelasHistorico;
  end;
end;

procedure TfrmPrincipal.Arrow2Click(Sender: TObject);
var
  i: Integer;
  lSelected: boolean;
begin
  while TemCampoSelecionado(chkCamposUtilizados) > -1 do
  begin
    i := TemCampoSelecionado(chkCamposUtilizados);
    if (i > -1) and not (DataModule1.CampoLancamentoLocateDescricao(chkCamposUtilizados.Items.Strings[i]) > -1) or not DataModule1.CampoLancamentoObrigatorio then
    begin
      if (chkCamposUtilizados.Count >= (i + 2)) then
        lSelected := chkCamposUtilizados.Selected[i + 1];

      chkCamposDisponiveis.Items.Add(chkCamposUtilizados.Items.Strings[i]);
      chkCamposUtilizados.Items.Delete(i);
      if (chkCamposUtilizados.Count >= (i + 1)) then
        chkCamposUtilizados.Selected[i] := lSelected;
    end
    else
    begin
      i := TemCampoSelecionado(chkCamposUtilizados);
      chkCamposUtilizados.Selected[i] := false;
    end;


    CarregarTabelasHistorico;
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

    if (chkLayoutsDisponiveis.Count > (i + 1)) then
      lSelected := chkLayoutsDisponiveis.Selected[i + 1];

    chkLayoutsUtilizados.Items.Add(chkLayoutsDisponiveis.Items.Strings[i]);
    chkLayoutsDisponiveis.Items.Delete(i);
    fLayoutsUtilizados.Add(fLayoutsDisponiveis.Strings[i]);
    fLayoutsDisponiveis.Delete(i);

    if (chkLayoutsDisponiveis.Count >= (i + 1)) then
      chkLayoutsDisponiveis.Selected[i] := lSelected;
  end;
end;

procedure TfrmPrincipal.btnApagarCondicaoClick(Sender: TObject);
begin
  fCamposCondicoes.DeleteSelected;
end;

procedure TfrmPrincipal.btnCancelarLayout1Click(Sender: TObject);
begin
  CarregarProcesso;
  HabilitarCamposProcessos(false);
end;

procedure TfrmPrincipal.btnClienteCancelarClick(Sender: TObject);
begin
  fEstadoCliente := taNada;
  edtClienteDescricao.Enabled := false;

  if not DataModule1.qClientes.IsEmpty then
  begin
    edtClienteClassificacao.Text := MascararTexto(DataModule1.qClientes.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
    edtClienteDescricao.Text := DataModule1.qClientes.FieldByName('descricao').AsString;
    edtClienteCodigo.Text := DataModule1.qClientes.FieldByName('codigo_externo').AsString;
  end;
end;

procedure TfrmPrincipal.btnClienteGravarClick(Sender: TObject);
begin
  if (fEstadoCliente = taInclusao) then
    GravarInserirCliente();
end;

procedure TfrmPrincipal.btnClienteNextClick(Sender: TObject);
begin
  if (DataModule1.qClientes.Active) and not (DataModule1.qClientes.IsEmpty) then
  begin
    DataModule1.qClientes.Next;
    edtClienteClassificacao.Text := MascararTexto(DataModule1.qClientes.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
    edtClienteDescricao.Text := DataModule1.qClientes.FieldByName('descricao').AsString;
    edtClienteCodigo.Text := DataModule1.qClientes.FieldByName('codigo_externo').AsString;
  end;
end;

procedure TfrmPrincipal.btnClienteNovoClick(Sender: TObject);
begin
  fEstadoCliente := taInclusao;

  if Vazio(fCodigoClientes) then
    MensagemAlerta('Por favor, escolha uma conta base antes.', 'Alerta')
  else
  begin
    edtClienteClassificacao.Text := GerarClassificacaoCliente();
    edtClienteDescricao.Text := '';
    edtClienteCodigo.Text := ProximoCodigoPlanoConta();

    edtClienteDescricao.Enabled := true;
    edtClienteDescricao.SetFocus;
  end;
end;

procedure TfrmPrincipal.btnClientePriorClick(Sender: TObject);
begin
  if (DataModule1.qClientes.Active) and not (DataModule1.qClientes.IsEmpty) then
  begin
    DataModule1.qClientes.Prior;
    edtClienteClassificacao.Text := MascararTexto(DataModule1.qClientes.FieldByName('codigo').AsString, edtMascaraPlanoContas.Text);
    edtClienteDescricao.Text := DataModule1.qClientes.FieldByName('descricao').AsString;
    edtClienteCodigo.Text := DataModule1.qClientes.FieldByName('codigo_externo').AsString;
  end;
end;

procedure TfrmPrincipal.btnEditarLayout1Click(Sender: TObject);
begin
  fEstadoProcesso := taEdicao;
  HabilitarCamposProcessos(true);
end;

procedure TfrmPrincipal.btnExcluirDadosCampoClick(Sender: TObject);
const
  lTabela = 'DadosCampos';
var
  lComando: String;
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

