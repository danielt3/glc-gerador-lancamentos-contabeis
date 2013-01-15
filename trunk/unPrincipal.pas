unit unPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, StdCtrls, DBGrids, DbCtrls, ZConnection, ZDataset, unDataModule;

type
  { TfrmPrincipal }
  TTipoAcao = (taNada, taInclusao, taEdicao);

  TfrmPrincipal = class(TForm)
    btnGravarEmpresa: TButton;
    btnExportarPlano: TButton;
    btnImportarPlano: TButton;
    btnNovaEmpresa: TButton;
    btnEditarEmpresa: TButton;
    Button2: TButton;
    Button4: TButton;
    Conexao: TZConnection;
    dbgPlano: TDBGrid;
    dbgPlano1: TDBGrid;
    cmbEmpresa: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    edtCodigoEmpresa: TEdit;
    edtNomeEmpresa: TEdit;
    edtCNPJEmpresa: TEdit;
    edtExportarPlano: TEdit;
    edtImportarPlano: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    OpenDialog1: TOpenDialog;
    PageControl: TPageControl;
    PageControl2: TPageControl;
    pContador: TTabSheet;
    pClientes: TTabSheet;
    pPlanoContas: TTabSheet;
    pVinculador: TTabSheet;
    pEmpresa: TTabSheet;
    pIntegracao: TTabSheet;
    pAjuda: TTabSheet;
    procedure btnEditarEmpresaClick(Sender: TObject);
    procedure btnGravarEmpresaClick(Sender: TObject);
    procedure btnNovaEmpresaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    //Empresa
    fEstadoEmpresa: TTipoAcao;
    fEmpresaAtual: Integer;
    //Geral
    function ApenasNumeros(Texto: String): String;
    function Vazio(Texto: String): Boolean;
    function FormatarCPFCNPJ(Texto: String): String;
    procedure MensagemErro(Mensagem, pCaption: String);
    procedure MensagemAlerta(Mensagem, pCaption: String);
    //Empresa
    procedure NovaEmpresa;
    procedure EditarEmpresa;
    function GravarEmpresa: Boolean;
    function ValidarEmpresa: Boolean;
    function GravarInserirEmpresa: Boolean;
    function GravarAlterarEmpresa: Boolean;
    procedure CarregarEmpresa(Empresa: Integer);
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

function TfrmPrincipal.ApenasNumeros(Texto: String): String;
var
  i: Integer;
  lResultado: String;
begin
  result := '';

  for i := 1 to Length(Texto) do
  begin
    if (Texto[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
      result := result + Texto[i];
  end;
end;

function TfrmPrincipal.Vazio(Texto: String): Boolean;
begin
  result := Trim(Texto) = EmptyStr;
end;

function TfrmPrincipal.FormatarCPFCNPJ(Texto: String): String;
var
  lDocumento: String;
begin
  result := '';

  if not Vazio(Texto) then
  begin
    lDocumento := ApenasNumeros(Texto);

    if (Length(lDocumento) = 11) then
      result := Copy(lDocumento, 1, 3) + '.' + Copy(lDocumento, 4, 3) + '.' + Copy(lDocumento, 7, 3) + '.' + Copy(lDocumento, 10, 2)
    else if (Length(lDocumento) = 14) then
      result := Copy(lDocumento, 1, 2) + '.' + Copy(lDocumento, 3, 3) + '.' + Copy(lDocumento, 6, 3) + '/' + Copy(lDocumento, 9, 4) + '-' + Copy(lDocumento, 13, 2)
    else
      result := lDocumento;
  end;
end;

procedure TfrmPrincipal.MensagemErro(Mensagem, pCaption: String);
begin
  MessageDlg(pCaption, Mensagem, mtError, [mbOK], 0);
end;

procedure TfrmPrincipal.MensagemAlerta(Mensagem, pCaption: String);
begin
  MessageDlg(pCaption, Mensagem, mtWarning, [mbOK], 0);
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
                '  empresa' +
                'SET' +
                '  codigo = ' + QuotedStr(ApenasNumeros(edtCodigoEmpresa.Text)) + ',' +
                '  nome = ' + QuotedStr(Trim(edtNomeEmpresa.Text)) + ',' +
                '  cnpj = ' + QuotedStr(ApenasNumeros(edtCNPJEmpresa.Text)) + ',' +
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
                '  cnpj' +
                'FROM' +
                '  empresa' +
                'WHERE' +
                '  chave = ' + IntToStr(Empresa);

    if (DataModule1.Consultar(lComando) > 1) then
    begin
      edtCodigoEmpresa.Text := DataModule1.qConsulta.FieldByName('codigo').AsString;
      edtNomeEmpresa.Text := DataModule1.qConsulta.FieldByName('nome').AsString;
      edtCNPJEmpresa.Text := FormatarCPFCNPJ(DataModule1.qConsulta.FieldByName('cnpj').AsString);
      fEmpresaAtual:= Empresa;
    end;
  except on e:exception do
    MensagemErro(e.Message, 'Alterar empresa.');
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  //DataModule1.Conexao.Connect;
end;

procedure TfrmPrincipal.Label7Click(Sender: TObject);
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

procedure TfrmPrincipal.btnGravarEmpresaClick(Sender: TObject);
begin
  GravarEmpresa;
end;

procedure TfrmPrincipal.btnEditarEmpresaClick(Sender: TObject);
begin
  EditarEmpresa;
end;

end.

