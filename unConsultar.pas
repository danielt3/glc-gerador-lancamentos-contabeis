unit unConsultar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids, unDataModule, unListaCodigo, unGarbageCollector, unUtilitario;

type

  { TfrmConsultar }
  TonRegistroSelecionado = procedure(pRegistro: Integer) of object;

  TfrmConsultar = class(TForm)
    btnCancelar: TButton;
    btnOK: TButton;
    dbgConsulta: TDBGrid;
    edtConsultarPlanoClassificacao: TEdit;
    Label27: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
  private
    fEmpresaSelecionada: Integer;
    fonRegistroSelecionado: TonRegistroSelecionado;
    { private declarations }
  public
    property onRegistroSelecionado: TonRegistroSelecionado read fonRegistroSelecionado write fonRegistroSelecionado;
    property EmpresaSelecionada: Integer read fEmpresaSelecionada write fEmpresaSelecionada;
  end; 

var
  frmConsultar: TfrmConsultar;

implementation

{$R *.lfm}

{ TfrmConsultar }

procedure TfrmConsultar.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmConsultar.btnOKClick(Sender: TObject);
begin
  if Assigned(fonRegistroSelecionado) then
  begin
    if not dbgConsulta.DataSource.DataSet.IsEmpty then
      fonRegistroSelecionado(dbgConsulta.DataSource.DataSet.FieldByName('chave').AsInteger)
    else
      fonRegistroSelecionado(0);
  end;

  ModalResult := mrOK;
end;

procedure TfrmConsultar.dbgConsultaDblClick(Sender: TObject);
begin
  if Assigned(fonRegistroSelecionado) then
  begin
    if Assigned(dbgConsulta.DataSource) and Assigned(dbgConsulta.DataSource.DataSet) and not (dbgConsulta.DataSource.DataSet.IsEmpty) then
      fonRegistroSelecionado(dbgConsulta.DataSource.DataSet.FieldByName('chave').AsInteger)
    else
      fonRegistroSelecionado(0);
  end;

  ModalResult := mrOK;
end;

end.

