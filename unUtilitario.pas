unit unUtilitario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;


  function ApenasNumeros(Texto: String): String;
  function Vazio(Texto: String): Boolean;
  function AlignLeft(Texto: String; Tamanho: Integer; Caractere: String = ' '): String;
  function AlignRight(Texto: String; Tamanho: Integer; Caractere: String = ' '): String;
  function FormatarCPFCNPJ(Texto: String): String;
  procedure MensagemErro(Mensagem, pCaption: String);
  procedure MensagemAlerta(Mensagem, pCaption: String);
  procedure MensagemSucesso(Mensagem, pCaption: String);

const
  NewLine = #13#10;

implementation

function ApenasNumeros(Texto: String): String;
var
  i: Integer;
begin
  result := '';

  for i := 1 to Length(Texto) do
  begin
    if (Texto[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
      result := result + Texto[i];
  end;
end;

function Vazio(Texto: String): Boolean;
begin
  result := Trim(Texto) = EmptyStr;
end;

function AlignLeft(Texto: String; Tamanho: Integer; Caractere: String): String;
var
  i: Integer;
begin
  if (Length(Texto) > Tamanho) then
    result := Copy(Texto, 1, Tamanho)
  else
  begin
    result := Trim(Texto);

    for i := 0 to (Tamanho - Length(result)) do
      result := result + Caractere;
  end;
end;

function AlignRight(Texto: String; Tamanho: Integer; Caractere: String): String;
var
  i: Integer;
begin
  if (Length(Texto) > Tamanho) then
    result := Copy(Texto, 1, Tamanho)
  else
  begin
    result := '';

    for i := 0 to (Tamanho - Length(result)) do
      result := result + Caractere;

    result := result + Trim(Texto);
  end;
end;

function FormatarCPFCNPJ(Texto: String): String;
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

procedure MensagemErro(Mensagem, pCaption: String);
begin
  MessageDlg(pCaption, Mensagem, mtError, [mbOK], 0);
end;

procedure MensagemAlerta(Mensagem, pCaption: String);
begin
  MessageDlg(pCaption, Mensagem, mtWarning, [mbOK], 0);
end;

procedure MensagemSucesso(Mensagem, pCaption: String);
begin
  MessageDlg(pCaption, Mensagem, mtInformation, [mbOK], 0);
end;

end.

