program Ativador;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

type

  { TAtivador }

  TAtivador = class(TCustomApplication)
  private
    procedure GerarChave;
    function Encrypt(const s: string; Key: Word):String;
    function Decrypt(const s: string; Key: Word):String;
    function  AlignRight(Texto: String; Tamanho: Integer; Caractere: Char = ' '): String;
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

const
  c1 = 53641;
  c2 = 25519;
  ChaveGeral = 255;

{ TAtivador }

procedure TAtivador.GerarChave;
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

    lArquivo.SaveToFile('fbdata.dll');
  finally
    FreeAndNil(lArquivo);
  end;
end;

function TAtivador.Encrypt(const s: string; Key: Word): String;
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

function TAtivador.Decrypt(const s: string; Key: Word): String;
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

function TAtivador.AlignRight(Texto: String; Tamanho: Integer; Caractere: Char): String;
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

procedure TAtivador.DoRun;
var
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h','help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h','help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
  GerarChave;

  // stop program loop
  Terminate;
end;

constructor TAtivador.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TAtivador.Destroy;
begin
  inherited Destroy;
end;

procedure TAtivador.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ',ExeName,' -h');
end;

var
  Application: TAtivador;
begin
  Application:=TAtivador.Create(nil);
  Application.Title:='Ativador';
  Application.Run;
  Application.Free;
end.

