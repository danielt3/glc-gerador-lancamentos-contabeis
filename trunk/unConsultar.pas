unit unConsultar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids;

type

  { TfrmConsultar }
  TonRegistroSelecionado = procedure(pRegistro: Integer) of object;
  TonValidade = function: Boolean of object;

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
    fonValidade: TonValidade;
    { private declarations }
  public
    property onRegistroSelecionado: TonRegistroSelecionado read fonRegistroSelecionado write fonRegistroSelecionado;
    property onValidade: TonValidade read fonValidade write fonValidade;
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
  if not Assigned(onValidade) or onValidade() then
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
end;

procedure TfrmConsultar.dbgConsultaDblClick(Sender: TObject);
begin
  if not Assigned(onValidade) or onValidade() then
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
end;

end.

