unit unConsultarPlanoContas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids, unConsultar, unDataModule, unListaCodigo, ZAbstractRODataset,
  unGarbageCollector, unUtilitario, Grids, Windows;

type

  { TfrmConsultarPlanoContas }

  TfrmConsultarPlanoContas = class(TfrmConsultar)
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    edtConsultarPlanoDescricao: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtConsultarPlanoClassificacaoChange(Sender: TObject);
    procedure edtConsultarPlanoDescricaoChange(Sender: TObject);
  private
    fMascara: String;
    { private declarations }
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
                 '  a.descricao' +  NewLine +
                 'FROM' +  NewLine +
                 '  plano_contas a' +  NewLine +
                 'WHERE' +  NewLine +
                 '  a.empresa = ' + IntToStr(EmpresaSelecionada) +  NewLine +
                 '  AND a.sintetica = ''A''' +  NewLine;

  if not Vazio(PClassificacao) then
    lComandoSQL := lComandoSQL + '  AND a.codigo >= ' + QuotedStr(ApenasNumeros(PClassificacao)) +  NewLine;
  if not Vazio(pDescricao) then
    lComandoSQL := lComandoSQL + '  AND a.descricao LIKE ' + QuotedStr(Trim(pDescricao) + '%') +  NewLine;

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
end;

procedure TfrmConsultarPlanoContas.ComboBox3Change(Sender: TObject);
begin
  DataModule1.getQuery(NomeTabela).SortedFields := 'descricao';
  if ComboBox3.ItemIndex = 0 then
    DataModule1.getQuery(NomeTabela).SortType := stAscending
  else
    DataModule1.getQuery(NomeTabela).SortType := stDescending;
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

end.

