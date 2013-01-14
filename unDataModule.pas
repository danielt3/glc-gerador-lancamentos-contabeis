unit unDataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZConnection, ZDataset;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    Conexao: TZConnection;
    qConsulta: TZQuery;
    qExecutar: TZQuery;
  private
    function Conectar: Boolean;
  public
    function Executar(SQL: String): Boolean;
    function Consultar(SQL: String): Integer;
    function GerarChave(NomeGenerator: String): Integer;
  end; 

var
  DataModule1: TDataModule1; 

implementation

{$R *.lfm}

{ TDataModule1 }

function TDataModule1.Conectar: Boolean;
begin
  result := false;
  Conexao.Connect;
  result := Conexao.Connected;
end;

function TDataModule1.Executar(SQL: String): Boolean;
begin
  result := false;

  try
    qExecutar.Close;
    qExecutar.SQL.Clear;
    qExecutar.SQL.Add(SQL);
    qExecutar.Prepared:= true;
    qExecutar.ExecSQL;

    result := true;
  except
    RaiseLastOSError;
  end;
end;

function TDataModule1.Consultar(SQL: String): Integer;
begin
  result := 0;

  try
    qConsulta.Close;
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add(SQL);
    qConsulta.Open;

    if not qConsulta.IsEmpty then
      result := qConsulta.RecordCount;
  except
    RaiseLastOSError;
  end;
end;

function TDataModule1.GerarChave(NomeGenerator: String): Integer;
begin
  result := 0;

  try
    qConsulta.Close;
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('SELECT GEN_ID(' + NomeGenerator + ', 1 ) AS chave FROM RDB$DATABASE');
    qConsulta.Open;

    if not qConsulta.IsEmpty then
      result := qConsulta.FieldByName('chave').AsInteger;
  except
    RaiseLastOSError;
  end;
end;

end.

