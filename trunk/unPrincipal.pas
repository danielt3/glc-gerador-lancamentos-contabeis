unit unPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, StdCtrls, DBGrids, DbCtrls, Buttons, Grids, CheckLst, FileCtrl,
  EditBtn, ActnList, ExtCtrls, PairSplitter, ShellCtrls, ColorBox,
  PopupNotifier, Calendar, Arrow, ZConnection, unDataModule, unListaCodigo,
  unGarbageCollector, unUtilitario, db, ExtendedNotebook, RTTICtrls, types,
  ZAbstractRODataset;

type
  { TfrmPrincipal }
  TTipoAcao = (taNada, taInclusao, taEdicao);

  TfrmPrincipal = class(TForm)
    Arrow1: TArrow;
    Arrow2: TArrow;
    Arrow3: TArrow;
    Arrow4: TArrow;
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
    Button13: TButton;
    btnGravarLayout: TButton;
    btnCancelarLayout: TButton;
    btnEditarLayout: TButton;
    btnNovoLayout: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    chkCamposDisponiveis: TCheckListBox;
    chkCamposUtilizados: TCheckListBox;
    chkLayoutsDisponiveis: TCheckListBox;
    chkLayoutsUtilizados: TCheckListBox;
    cmbEmpresa: TComboBox;
    cmbPlanoContasTipo2: TDBLookupComboBox;
    cmbCodigoDebitar: TComboBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    cmbClassificacaoDebitar: TComboBox;
    cmbNomeDebitar: TComboBox;
    cmbCodigoCreditar: TComboBox;
    cmbClassificacaoCreditar: TComboBox;
    cmbNomeCreditar: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Conexao: TZConnection;
    dbgPlano1: TDBGrid;
    dbgLayouts: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid4: TDBGrid;
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
    edtExportarPlano: TEdit;
    edtExportarPlano1: TEdit;
    edtImportarPlano: TEdit;
    edtImportarPlano1: TEdit;
    edtNomeEmpresa: TEdit;
    edtNomeVinculador: TEdit;
    edtHistorico: TEdit;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    gbTabelasUtilizadas: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    gbInformacoes: TGroupBox;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
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
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    memAnotacoes: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl: TPageControl;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    pContador: TTabSheet;
    pClientes: TTabSheet;
    popEmpresa: TPopupMenu;
    popVinculador: TPopupMenu;
    popPlanoContas: TPopupMenu;
    popLayout: TPopupMenu;
    pPlanoContas: TTabSheet;
    pVinculador: TTabSheet;
    pEmpresa: TTabSheet;
    pIntegracao: TTabSheet;
    pAjuda: TTabSheet;
    Splitter1: TSplitter;
    TabSheet1: TTabSheet;
    pLeiaute: TTabSheet;
    procedure Arrow1Click(Sender: TObject);
    procedure Arrow2Click(Sender: TObject);
    procedure btnCancelarLayoutClick(Sender: TObject);
    procedure btnEditarEmpresa1Click(Sender: TObject);
    procedure btnEditarEmpresaClick(Sender: TObject);
    procedure btnGravarEmpresa2Click(Sender: TObject);
    procedure btnGravarEmpresa3Click(Sender: TObject);
    procedure btnGravarEmpresaClick(Sender: TObject);
    procedure btnImportarPlanoClick(Sender: TObject);
    procedure btnNovaEmpresa1Click(Sender: TObject);
    procedure btnNovaEmpresaClick(Sender: TObject);
    procedure btnNovoLayoutClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure btnGravarLayoutClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure cmbCodigoCreditarChange(Sender: TObject);
    procedure cmbCodigoDebitarChange(Sender: TObject);
    procedure cmbEmpresaChange(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure dbgPlano1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgPlanoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
    procedure EmpresaProxima(Sender: TObject);
    procedure EmpresaAnterior(Sender: TObject);
    procedure cmbLookupKeyPress(Sender: TObject; var Key: char);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
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
    fListaCredito: TStringList;
    //Layouts
    fLayoutAtual: Integer;
    fEstadoLayout: TTipoAcao;

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
    //Vinculadores
    function  CarregarVinculadores(pEmpresa4: Integer): Boolean;
    procedure LimparTelaVinculadores;
    procedure HabilitarVinculadores(Habilitar: Boolean);
    procedure NovoVinculador;
    procedure EditarVinculador;
    procedure ExcluirVinculador;
    procedure CancelarVinculador;
    function  CarregarVinculador: Boolean;
    function GravarVinculador: Boolean;
    function GravarInserirVinculador: Boolean;
    function GravarAlterarVinculador: Boolean;
    //Layouts
    function  CarregarLayouts(pEmpresa4: Integer): Boolean;
    procedure CarregarLayout;
    procedure CarregarCamposLayout;
    procedure LimparTelaLayouts;
    procedure HabilitarLayout(Habilitar: Boolean);
    procedure NovoLayout;
    procedure ExcluirLayout;
    procedure CancelarLayout;
    function  TemCampoSelecionado(pLista: TCheckListBox): Integer;
    function GravarLayout: Boolean;
    function GravarInserirLayout: Boolean;
    function GravarInserirLayoutCampos: Boolean;
    function GravarAlterarLayout: Boolean;
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
      CarregarVinculadores(fEmpresaAtual);
      CarregarLayouts(fEmpresaAtual);
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
  DataModule1.qPlanoContas.Open;

  CarregarCombosPlano;

  teste := DataModule1.qPlanoContas.RowsAffected;
  result := not DataModule1.qPlanoContas.IsEmpty;
  dbgPlano.DataSource := DataModule1.dsPlanoContas;
  CarregarTelaPlanoDeContas;
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
    LimparTelaPlanoContas;
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
begin
  DataModule1.qPlanoContas.First;

  while not DataModule1.qPlanoContas.Eof do
  begin
    fListaDebito.Add(DataModule1.qPlanoContas.FieldByName('CHAVE').AsString);
    fListaCredito.Add(DataModule1.qPlanoContas.FieldByName('chave').AsString);
    cmbCodigoDebitar.Items.Add(DataModule1.qPlanoContas.FieldByName('codigo').AsString);
    cmbCodigoCreditar.Items.Add(DataModule1.qPlanoContas.FieldByName('codigo').AsString);
    cmbClassificacaoDebitar.Items.Add(MascararTexto(DataModule1.qPlanoContas.FieldByName('classificacao').AsString, edtMascaraPlanoContas.Text));
    cmbClassificacaoCreditar.Items.Add(MascararTexto(DataModule1.qPlanoContas.FieldByName('classificacao').AsString, edtMascaraPlanoContas.Text));
    cmbNomeDebitar.Items.Add(DataModule1.qPlanoContas.FieldByName('descricao').AsString);
    cmbNomeCreditar.Items.Add(DataModule1.qPlanoContas.FieldByName('descricao').AsString);

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

  edtPlanoContasCodigo.Enabled := true;
  edtPlanoContasClassificacao.Enabled := true;
  edtPlanoContasDescricao.Enabled := true;
  cmbPlanoContasTipo.Enabled := true;

  PageControl.ActivePage := pContador;
  PageControl2.ActivePage := pPlanoContas;
  edtPlanoContasCodigo.SetFocus;
end;

procedure TfrmPrincipal.EditarPlanoContas;
begin
  if not (DataModule1.qPlanoContas.IsEmpty) then
  begin
    CarregarTelaPlanoDeContas;
    fEstadoPlano := taEdicao;

    edtPlanoContasCodigo.Enabled := true;
    edtPlanoContasClassificacao.Enabled := true;
    edtPlanoContasDescricao.Enabled := true;
    cmbPlanoContasTipo.Enabled := true;

    PageControl.ActivePage := pContador;
    PageControl2.ActivePage := pPlanoContas;
    edtPlanoContasCodigo.SetFocus;
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
                 '  b.chave AS id_creditar,' + NewLine +
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
  cmbCodigoDebitar.ItemIndex := -1;
  cmbCodigoDebitar.Text := '';
  cmbCodigoCreditar.ItemIndex := -1;
  cmbCodigoCreditar.Text := '';
  cmbClassificacaoDebitar.ItemIndex := -1;
  cmbClassificacaoDebitar.Text := '';
  cmbClassificacaoCreditar.ItemIndex := -1;
  cmbClassificacaoCreditar.Text := '';
  cmbNomeDebitar.ItemIndex := -1;
  cmbNomeDebitar.Text := '';
  cmbNomeCreditar.ItemIndex := -1;
  cmbNomeCreditar.Text := '';
  edtHistorico.Text := '';
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
  cmbCodigoDebitar.Color := lCor;
  cmbCodigoDebitar.Enabled := Habilitar;
  cmbCodigoCreditar.Color := lCor;
  cmbCodigoCreditar.Enabled := Habilitar;
  cmbClassificacaoDebitar.Color := lCor;
  cmbClassificacaoDebitar.Enabled := Habilitar;
  cmbClassificacaoCreditar.Color := lCor;
  cmbClassificacaoCreditar.Enabled := Habilitar;
  cmbNomeDebitar.Color := lCor;
  cmbNomeDebitar.Enabled := Habilitar;
  cmbNomeCreditar.Color := lCor;
  cmbNomeCreditar.Enabled := Habilitar;
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
  edtCodigoVinculador.Text := '0';
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
                   '  vinculador' + NewLine +
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

function TfrmPrincipal.CarregarVinculador: Boolean;
begin
  if not (DataModule1.qVinculadores.IsEmpty) then
  begin
    fVinculadorAtual := DataModule1.qVinculadores.FieldByName('chave').AsInteger;

    edtCodigoVinculador.Text := DataModule1.qVinculadores.FieldByName('chave').AsString;
    edtNomeVinculador.Text := DataModule1.qVinculadores.FieldByName('descricao').AsString;
    cmbCodigoDebitar.ItemIndex := fListaDebito.IndexOf(DataModule1.qVinculadores.FieldByName('id_debitar').AsString);
    cmbClassificacaoDebitar.ItemIndex := fListaDebito.IndexOf(DataModule1.qVinculadores.FieldByName('id_debitar').AsString);
    cmbNomeDebitar.ItemIndex := fListaDebito.IndexOf(DataModule1.qVinculadores.FieldByName('id_debitar').AsString);
    cmbCodigoCreditar.ItemIndex := fListaCredito.IndexOf(DataModule1.qVinculadores.FieldByName('id_creditar').AsString);
    cmbClassificacaoCreditar.ItemIndex := fListaCredito.IndexOf(DataModule1.qVinculadores.FieldByName('id_creditar').AsString);
    cmbNomeCreditar.ItemIndex := fListaCredito.IndexOf(DataModule1.qVinculadores.FieldByName('id_creditar').AsString);
    edtHistorico.Text := DataModule1.qVinculadores.FieldByName('historico').AsString;
  end
  else
    LimparTelaVinculadores;
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

  CarregarVinculadores(fEmpresaAtual);
  DataModule1.qVinculadores.Locate('CHAVE', IntToStr(lVinculadorAtual), []);
  CarregarVinculador;

  HabilitarVinculadores(false);
end;

function TfrmPrincipal.GravarInserirVinculador: Boolean;
var
  lComando: String;
begin
  result := false;

  try
    fVinculadorAtual := DataModule1.GerarChave('GEN_VINCULADORES');
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
                '' + IntToStr(fVinculadorAtual) + ',' + NewLine +
                '' + QuotedStr(Trim(edtNomeVinculador.Text)) + ',' + NewLine +
                '' + fListaDebito.Strings[cmbCodigoDebitar.ItemIndex] + ',' + NewLine +
                '' + fListaCredito.Strings[cmbCodigoCreditar.ItemIndex] + ',' + NewLine +
                '' + QuotedStr(edtHistorico.Text) + ')';

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Inserir vinculador.');
  end;
end;

function TfrmPrincipal.GravarAlterarVinculador: Boolean;
var
  lComando: String;
begin
  result := false;

  try
    lComando := 'UPDATE' + NewLine +
                '  vinculadores' + NewLine +
                'SET ' + NewLine +
                '  descricao = ' + QuotedStr(Trim(edtNomeVinculador.Text)) + ',' + NewLine +
                '  debitar = ' + fListaDebito.Strings[cmbCodigoDebitar.ItemIndex] + ',' + NewLine +
                '  creditar = ' + fListaCredito.Strings[cmbCodigoCreditar.ItemIndex] + ',' + NewLine +
                '  historico = ' + QuotedStr(edtHistorico.Text) + NewLine +
                'WHERE' + NewLine +
                '  chave = ' + IntToStr(fVinculadorAtual);

    result := DataModule1.Executar(lComando);
  except on e:exception do
    MensagemErro(e.Message, 'Alterar vinculador.');
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
  end
  else
    LimparTelaLayouts;
end;

procedure TfrmPrincipal.CarregarCamposLayout;
var
  lComandoSQL: String;
  i: Integer;
begin
  for i := 0 to chkCamposUtilizados.Items.Count - 1 do
    chkCamposDisponiveis.Items.Add(chkCamposUtilizados.Items.Strings[i]);

  while (chkCamposUtilizados.Items.Count > 0) do
    chkCamposUtilizados.Items.Delete(0);

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
      chkCamposUtilizados.Items.Add(DataModule1.getQuery('CamposLayout').FieldByName('nome').AsString);

      if (chkCamposDisponiveis.Items.IndexOf(DataModule1.getQuery('CamposLayout').FieldByName('nome').AsString) > -1) then
        chkCamposDisponiveis.Items.Delete(chkCamposDisponiveis.Items.IndexOf(DataModule1.getQuery('CamposLayout').FieldByName('nome').AsString));

      DataModule1.getQuery('CamposLayout').Next;
    end;
  end;
end;

procedure TfrmPrincipal.LimparTelaLayouts;
var
  i: Integer;
begin
  edtNomeLayout.Text := '';

  for i := 0 to chkCamposUtilizados.Items.Count - 1 do
    chkCamposDisponiveis.Items.Append(chkCamposUtilizados.Items.Strings[i]);

  chkCamposUtilizados.Items.Clear;

  for i := 0 to chkCamposDisponiveis.Items.Count - 1 do
    chkCamposDisponiveis.Checked[i] := false;
end;

procedure TfrmPrincipal.HabilitarLayout(Habilitar: Boolean);
begin
  gbNomeLayout.Enabled := Habilitar;
  gbTabelasDisponiveis.Enabled := Habilitar;
  gbTabelasUtilizadas.Enabled := Habilitar;
  gbInformacoes.Enabled := Habilitar;
end;

procedure TfrmPrincipal.NovoLayout;
begin
  LimparTelaLayouts;

  fEstadoLayout := taInclusao;

  HabilitarLayout(true);

  PageControl.ActivePage := pContador;
  PageControl2.ActivePage := pLeiaute;
  edtNomeLayout.SetFocus;
end;

procedure TfrmPrincipal.ExcluirLayout;
var
  lComandoSQL: String;
begin
  if (fEmpresaAtual > 0) and (MensagemConfirmacao('Deseja realmente excluir esse Leiaute?', 'GLC')) then
  begin
    lComandoSQL := 'DELETE FROM' + NewLine +
                   '  layout_campos' + NewLine +
                   'WHERE' + NewLine +
                   '  layout = ' + IntToStr(fVinculadorAtual);

    DataModule1.Executar(lComandoSQL);

    lComandoSQL := 'DELETE FROM' + NewLine +
                   '  layouts' + NewLine +
                   'WHERE' + NewLine +
                   '  chave = ' + IntToStr(fVinculadorAtual);

    DataModule1.Executar(lComandoSQL);

    CarregarVinculadores(fEmpresaAtual);

    MensagemSucesso('Leiaute excluido com sucesso!', 'GLC');
  end;
end;

procedure TfrmPrincipal.CancelarLayout;
begin
  CarregarLayout;
  fEstadoLayout := taNada;
  HabilitarLayout(false);
end;

function TfrmPrincipal.TemCampoSelecionado(pLista: TCheckListBox): Integer;
var
  i: Integer;
begin
  result := -1;

  for i := 0 to pLista.Items.Count - 1 do
  begin
    if pLista.Checked[i] then
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
  if (fEstadoLayout = taInclusao) then
  begin
    result := GravarInserirLayout;
    lLayoutAtual := fLayoutAtual;
  end
  else if (fEstadoLayout = taEdicao) then
  begin
    lLayoutAtual := fLayoutAtual;
    result := GravarAlterarLayout;
  end;

  CarregarLayouts(fEmpresaAtual);
  DataModule1.qVinculadores.Locate('CHAVE', IntToStr(lLayoutAtual), []);
  CarregarLayout;

  HabilitarLayout(false);
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
    for i := 0 to chkCamposUtilizados.Items.Count do
    begin
      lCampoAtual := DataModule1.GerarChave('GEN_LAYOUT_CAMPOS');
      lComando := 'INSERT INTO layout_campos (' + NewLine +
                  'chave,' + NewLine +
                  'layout,' + NewLine +
                  'nome)' + NewLine +
                  'VALUES (' + NewLine +
                  '' + IntToStr(lCampoAtual) + ',' + NewLine +
                  '' + IntToStr(fLayoutAtual) + ',' + NewLine +
                  '' + QuotedStr(chkCamposUtilizados.Items.Strings[i]) + ')';

      result := result and DataModule1.Executar(lComando);
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Inserir Campos Layout.');
  end;
end;

function TfrmPrincipal.GravarAlterarLayout: Boolean;
begin

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  fGarbageCollector := TGarbageCollector.Create;

  fListaEmpresa := TListaCodigo.Create;
  fListaDebito := TStringList.Create;
  fListaCredito := TStringList.Create;
  fGarbageCollector.Add(fListaEmpresa);
  fGarbageCollector.Add(fListaDebito);
  fGarbageCollector.Add(fListaCredito);
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

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  DataModule1.Conexao.Connect;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtImportarPlano.Text := OpenDialog1.FileName;
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
  NovoPlanoContas;;
end;

procedure TfrmPrincipal.cmbCodigoCreditarChange(Sender: TObject);
var
  teste: Integer;
  lteste: String;
begin
  teste := TComboBox(Sender).ItemIndex;
  lteste := TComboBox(Sender).Text;

  if (TComboBox(Sender).Items.IndexOf(lteste) > -1) then
    teste := TComboBox(Sender).Items.IndexOf(lteste);

  cmbCodigoCreditar.ItemIndex := teste;
  cmbClassificacaoCreditar.ItemIndex := teste;
  cmbNomeCreditar.ItemIndex := teste;
end;

procedure TfrmPrincipal.cmbCodigoDebitarChange(Sender: TObject);
var
  teste: Integer;
  lteste: String;
begin
  teste := TComboBox(Sender).ItemIndex;
  lteste := TComboBox(Sender).Text;

  if (TComboBox(Sender).Items.IndexOf(lteste) > -1) then
    teste := TComboBox(Sender).Items.IndexOf(lteste);

  cmbCodigoDebitar.ItemIndex := teste;
  cmbClassificacaoDebitar.ItemIndex := teste;
  cmbNomeDebitar.ItemIndex := teste;
end;

procedure TfrmPrincipal.cmbEmpresaChange(Sender: TObject);
begin
  CarregarEmpresa(fListaEmpresa.Value(cmbEmpresa.ItemIndex));
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

procedure TfrmPrincipal.dbgPlano1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CarregarVinculador;
end;

procedure TfrmPrincipal.dbgPlanoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CarregarTelaPlanoDeContas;
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
  GravarEmpresa;
  CarregarListaEmpresa;
end;

procedure TfrmPrincipal.btnImportarPlanoClick(Sender: TObject);
begin
  if FileExists(edtImportarPlano.Text) then
  begin
    if ImportarPlanoDeContas(fEmpresaAtual, edtImportarPlano.Text, nil) then
    begin
      MensagemSucesso('Plano de contas importado com sucesso!', 'Importação de plano de contas');
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

procedure TfrmPrincipal.btnGravarEmpresa2Click(Sender: TObject);
begin
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
begin
  while TemCampoSelecionado(chkCamposDisponiveis) > -1 do
  begin
    i := TemCampoSelecionado(chkCamposDisponiveis);

    chkCamposUtilizados.Items.Add(chkCamposDisponiveis.Items.Strings[i]);
    chkCamposDisponiveis.Items.Delete(i);
  end;
end;

procedure TfrmPrincipal.Arrow2Click(Sender: TObject);
var
  i: Integer;
begin
  while TemCampoSelecionado(chkCamposUtilizados) > -1 do
  begin
    i := TemCampoSelecionado(chkCamposUtilizados);

    chkCamposDisponiveis.Items.Add(chkCamposUtilizados.Items.Strings[i]);
    chkCamposUtilizados.Items.Delete(i);
  end;
end;

end.

