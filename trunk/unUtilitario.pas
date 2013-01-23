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
  function  MascararTexto(Texto, Mascara: String): String;

  function  ENumero(Caractere: Char): Boolean;
  function  ELetra(Caractere: Char): Boolean;
  function  ENumeroOuLetra(Caractere: Char): Boolean;
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
    if ENumero(Texto[i]) then
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

function MascararTexto(Texto, Mascara: String): String;
var
  i: Integer;
  j: Integer;
begin
  result := '';
  j := 1;

  for i := 1 to Length(Mascara) do
  begin
    if (Length(Texto) >= j) then
    begin
      if ((Mascara[i] = 'N') and ENumero(Texto[j])) or
         ((Mascara[i] = 'L') and ELetra(Texto[j])) or
         ((Mascara[i] = 'X') and ENumeroOuLetra(Texto[j])) then
      begin
         result := result + Texto[j];
         j := j + 1;
      end
      else
        result := result + Mascara[i];
    end;
  end;

  for i := j to Length(Texto) do
    result := result + Texto[i];
  {for i := 1 to Length(Texto) do
  begin
    if Length(Mascara) >= i then
    begin
      if ((Mascara[i] = 'N') and ENumero(Texto[i])) or
         ((Mascara[i] = 'L') and ELetra(Texto[i])) or
         ((Mascara[i] = 'X') and ENumeroOuLetra(Texto[i])) then
         result := result + Texto[i]
      else
        result := result + Mascara[i] + Texto[i];
    end
    else
      result := result + Texto[i];
  end;}
end;

function ENumero(Caractere: Char): Boolean;
begin
  result := (Caractere in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']);
end;

function ELetra(Caractere: Char): Boolean;
const
  lLetras = 'AÁÀÂÃÄBCÇDEÉÈÊËFGHIÍÌÎÏJKLMNOÓÒÔÕÖPQRSTUÚÙÛÜVXWYZ';
begin
  result := Pos(UpperCase(Caractere), lLetras) > 0;
end;

function ENumeroOuLetra(Caractere: Char): Boolean;
begin
  result := ENumero(Caractere) or ELetra(Caractere);
end;

end.

