unit unNovoCampo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmNovoCampo }
  TonGravarCampo = procedure(pNomeCampo: String) of object;

  TfrmNovoCampo = class(TForm)
    btnCancelarCampo: TButton;
    btnGravarCampo: TButton;
    edtNomeCampo: TEdit;
    Label23: TLabel;
    procedure btnCancelarCampoClick(Sender: TObject);
    procedure btnGravarCampoClick(Sender: TObject);
  private
    fonGravarCampo: TonGravarCampo;
    { private declarations }
  public
    property onGravarCampo: TonGravarCampo read fonGravarCampo write fonGravarCampo;
  end; 

var
  frmNovoCampo: TfrmNovoCampo;

implementation

{$R *.lfm}

{ TfrmNovoCampo }

procedure TfrmNovoCampo.btnCancelarCampoClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmNovoCampo.btnGravarCampoClick(Sender: TObject);
begin
  if Assigned(fonGravarCampo) then
    fonGravarCampo(edtNomeCampo.Text);

  ModalResult := mrOK;
end;

end.

