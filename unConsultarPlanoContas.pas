unit unConsultarPlanoContas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids, unConsultar, unDataModule, unListaCodigo, ZAbstractRODataset,
  unGarbageCollector, unUtilitario, Grids, DbCtrls, Windows;

type

  { TfrmConsultarPlanoContas }

  TfrmConsultarPlanoContas = class(TfrmConsultar)
    cmbPlanoContasTipo2: TDBLookupComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    edtConsultarPlanoDescricao: TEdit;
    Label17: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    procedure cmbPlanoContasTipo2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtConsultarPlanoClassificacaoChange(Sender: TObject);
    procedure edtConsultarPlanoDescricaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fMascara: String;
    function ValidarPlano: Boolean;
  public
    procedure Consultar(PClassificacao: String = ''; pDescricao: String = '');
    property Mascara: String read fMascara write fMascara;
  end; 

var
  frmConsultarPlanoContas: TfrmConsultarPlanoContas;

const
  NomeTabela = 'ConsultarPlano';

implementation

{$R *.lfm}

{ TfrmConsultarPlanoContas }

procedure TfrmConsultarPlanoContas.Consultar(PClassificacao: String; pDescricao: String);
var
  lComandoSQL: String;
begin
  lComandoSQL := 'SELECT' +  NewLine +
                 '  a.chave,' +  NewLine +
                 '  a.codigo_externo,' +  NewLine +
                 '  a.codigo,' +  NewLine +
                 '  a.descricao,' +  NewLine +
                 '  a.sintetica' +  NewLine +
                 'FROM' +  NewLine +
                 '  plano_contas a' +  NewLine +
                 'WHERE' +  NewLine +
                 '  a.empresa = ' + IntToStr(EmpresaSelecionada) +  NewLine;

  if not Vazio(PClassificacao) then
    lComandoSQL := lComandoSQL + '  AND a.codigo >= ' + QuotedStr(ApenasNumeros(PClassificacao)) +  NewLine;
  if not Vazio(pDescricao) then
    lComandoSQL := lComandoSQL + '  AND a.descricao LIKE ' + QuotedStr(Trim(pDescricao) + '%') +  NewLine;

  if (cmbPlanoContasTipo2.ItemIndex = 1) then
    lComandoSQL := lComandoSQL + '  AND a.sintetica = ' + QuotedStr('S') + NewLine
  else if (cmbPlanoContasTipo2.ItemIndex = 2) then
    lComandoSQL := lComandoSQL + '  AND a.sintetica = ' + QuotedStr('A') + NewLine;

  lComandoSQL := lComandoSQL +
                 'ORDER BY' +  NewLine +
                 '  a.codigo';

  DataModule1.NovaConsulta(NomeTabela, lComandoSQL);
  dbgConsulta.DataSource := DataModule1.getDataSource(NomeTabela);
end;

procedure TfrmConsultarPlanoContas.dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  grid : TDBGrid;
  maskValue : String;
  aRect : TRect;
begin
  aRect := Rect;
  grid := sender as TDBGrid;
  if (UpperCase(Column.FieldName) = 'CODIGO') then
  begin
    maskValue := MascararTexto(grid.DataSource.DataSet.FieldByName('codigo').AsString, fMascara);

    grid.Canvas.FillRect(Rect);
    DrawText(grid.Canvas.Handle, PChar(maskValue), Length(maskValue), aRect, DT_SINGLELINE or DT_LEFT or DT_VCENTER);
  end;

  if (DataModule1.getQuery(NomeTabela).FieldByName('sintetica').AsString = 'S') then
  begin
    //dbgPlano.Canvas.Font.Color := clRed;
    dbgConsulta.Canvas.Font.Style := [fsBold];
    dbgConsulta.Canvas.FillRect(Rect);
    dbgConsulta.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
    //dbgPlano.Canvas.Font.Color := clRed;
    dbgConsulta.Canvas.Font.Style := [];
    dbgConsulta.Canvas.FillRect(Rect);
    dbgConsulta.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmConsultarPlanoContas.ComboBox3Change(Sender: TObject);
begin
  DataModule1.getQuery(NomeTabela).SortedFields := 'descricao';
  if ComboBox3.ItemIndex = 0 then
    DataModule1.getQuery(NomeTabela).SortType := stAscending
  else
    DataModule1.getQuery(NomeTabela).SortType := stDescending;
end;

procedure TfrmConsultarPlanoContas.cmbPlanoContasTipo2Change(Sender: TObject);
begin
  Consultar(edtConsultarPlanoClassificacao.Text, edtConsultarPlanoDescricao.Text);
end;

procedure TfrmConsultarPlanoContas.ComboBox4Change(Sender: TObject);
begin
  DataModule1.getQuery(NomeTabela).SortedFields := 'codigo';
  if ComboBox3.ItemIndex = 0 then
    DataModule1.getQuery(NomeTabela).SortType := stAscending
  else
    DataModule1.getQuery(NomeTabela).SortType := stDescending;
end;

procedure TfrmConsultarPlanoContas.edtConsultarPlanoClassificacaoChange(Sender: TObject);
begin
  Consultar(edtConsultarPlanoClassificacao.Text, edtConsultarPlanoDescricao.Text);
end;

procedure TfrmConsultarPlanoContas.edtConsultarPlanoDescricaoChange(Sender: TObject);
begin
  Consultar(edtConsultarPlanoClassificacao.Text, edtConsultarPlanoDescricao.Text);
end;

procedure TfrmConsultarPlanoContas.FormCreate(Sender: TObject);
begin
  cmbPlanoContasTipo2.Clear;
  cmbPlanoContasTipo2.AddItem('Todas', TObject('T'));
  cmbPlanoContasTipo2.AddItem('Sintética', TObject('S'));
  cmbPlanoContasTipo2.AddItem('Analítica', TObject('A'));
  cmbPlanoContasTipo2.ItemIndex := 0;

  onValidade := @ValidarPlano;
end;

function TfrmConsultarPlanoContas.ValidarPlano: Boolean;
begin
  result := true;

  if not (DataModule1.getQuery(NomeTabela).IsEmpty) then
  begin
    if DataModule1.getQuery(NomeTabela).FieldByName('sintetica').AsString = 'S' then
    begin
      MensagemAlerta('Não é permitido usar um plano sintético.', 'Consulta de Planos');
      result := false;
    end;
  end;
end;

end.

