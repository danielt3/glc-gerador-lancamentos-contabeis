unit unListaCodigo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TListaCodigo }

  TListaCodigo = class(TObject)
  private
    fListaCodigo: array of Integer;
    fCurrent: Integer;
  public
    constructor Create;
    destructor Destroy;

    procedure Clear;
    procedure Add(Value: Integer);
    function IndexOf(Value: Integer): Integer;
    function Value(Index: Integer): Integer;
  end;

implementation

{ TListaCodigo }

constructor TListaCodigo.Create;
begin
  Clear;
end;

destructor TListaCodigo.Destroy;
begin
  inherited Destroy;
  Clear;
end;

procedure TListaCodigo.Clear;
var
  i: Integer;
begin
  for i := Low(fListaCodigo) to High(fListaCodigo) do
    fListaCodigo[i] := 0;

  SetLength(fListaCodigo, 0);
end;

procedure TListaCodigo.Add(Value: Integer);
begin
  fCurrent := Length(fListaCodigo);
  SetLength(fListaCodigo, fCurrent + 1);

  fListaCodigo[fCurrent] := Value;
end;

function TListaCodigo.IndexOf(Value: Integer): Integer;
var
  i: Integer;
begin
  result := -1;

  for i := Low(fListaCodigo) to High(fListaCodigo) do
  begin
    if fListaCodigo[i] = Value then
    begin
      result := i;
      exit;
    end;
  end;
end;

function TListaCodigo.Value(Index: Integer): Integer;
begin
  if Index < Length(fListaCodigo) then
    result := fListaCodigo[Index]
  else
    result := 0;
end;

end.

