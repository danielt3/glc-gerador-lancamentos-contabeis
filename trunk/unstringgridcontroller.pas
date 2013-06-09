unit unStringGridController;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Grids;

type

  { TStringGridController }

  TStringGridController = class(TObject)
  private
    fIndexAtual: Integer;

    fStringGrid: TStringGrid;
  public
    procedure Clear;
    function Add(Coluna: Integer; Valor: String): Integer; Overload;
    function Add(Coluna, Linha: Integer; Valor: String): Integer; Overload;
    function Strings(Coluna, Linha: Integer): String; Overload;
    function Strings(Coluna: Integer): String; Overload;
    function RowCount: Integer;
    procedure DeleteSelected;

    procedure First;
    procedure Next;
    procedure Append;
    function  Eof: Boolean;

    property StringGrid: TStringGrid read fStringGrid write fStringGrid;
  end;

implementation

{ TStringGridController }

procedure TStringGridController.Clear;
var
  l, c: Integer;
begin
  if Assigned(fStringGrid) then
  begin
    for l := fStringGrid.RowCount - 1 downto 0 do
    begin
      for c := 0 to fStringGrid.ColCount - 1 do
        fStringGrid.Cells[c, l] := '';
    end;

    fStringGrid.RowCount := 0;
  end;
end;

function TStringGridController.Add(Coluna: Integer; Valor: String): Integer;
begin
  result := Add(Coluna, fIndexAtual, Valor);
end;

function TStringGridController.Add(Coluna, Linha: Integer; Valor: String
  ): Integer;
begin
  result := -1;

  if Assigned(fStringGrid) then
  begin
    if fStringGrid.RowCount < Linha + 1 then
      fStringGrid.RowCount := Linha + 1;

    fStringGrid.Cells[Coluna, Linha] := Valor;
    result := Linha;
  end;

  fIndexAtual := result;
end;

function TStringGridController.Strings(Coluna, Linha: Integer): String;
begin
  result := '';

  if Assigned(fStringGrid) and (fStringGrid.RowCount < Linha + 1) then
  begin
    result := fStringGrid.Cells[Coluna, Linha];
  end;
end;

function TStringGridController.Strings(Coluna: Integer): String;
begin
  result := '';

  if Assigned(fStringGrid) and (fIndexAtual >= 0) and (fStringGrid.RowCount > 0) then
  begin
    if (fStringGrid.RowCount < fIndexAtual + 1) then
      fIndexAtual := fStringGrid.RowCount - 1;

    result := fStringGrid.Cells[Coluna, fIndexAtual];
  end;
end;

function TStringGridController.RowCount: Integer;
begin
  if Assigned(fStringGrid) then
    result := fStringGrid.RowCount
  else
    result := 0;
end;

procedure TStringGridController.DeleteSelected;
begin
  if Assigned(fStringGrid) and (fStringGrid.Row > -1) then
  begin
    fStringGrid.DeleteRow(fStringGrid.Row);
  end;
end;

procedure TStringGridController.First;
begin
  fIndexAtual := 0;
end;

procedure TStringGridController.Next;
begin
  if (RowCount >= fIndexAtual + 1) then
    fIndexAtual := fIndexAtual + 1;
end;

procedure TStringGridController.Append;
begin
  fIndexAtual := fStringGrid.RowCount;
  fStringGrid.RowCount := fStringGrid.RowCount + 1;
end;

function TStringGridController.Eof: Boolean;
begin
  result := (RowCount = fIndexAtual);
  if (RowCount < fIndexAtual + 1) then
    fIndexAtual := RowCount - 1;
end;

end.

