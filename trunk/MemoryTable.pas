unit MemoryTable;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, unGarbageCollector;

type
  TStringValues = array of String;
  TIntegerValues = array of Integer;

  { TStringField }

  TStringField = class(TObject)
  private
    fValues: TStringValues;
  public
    Description: String;
    Name: String;

    property Values: TStringValues read fValues write fValues;
  end;

  { TIntegerField }

  TIntegerField = class(TObject)
  private
    fValues: TIntegerValues;
  public
    Description: String;
    Name: String;

    property Values: TIntegerValues read fValues write fValues;
  end;

  { TMemoryTable }

  TMemoryTable = class(TObject)
  private
    fCurrentIndex: Integer;
    fFieldList: TList;
    fGarbageCollector: TGarbageCollector;
  public
    constructor Create;
    destructor Destroy; override;

    function AddStringField(Name, Description: String): Boolean;
    function AddIntegerField(Name, Description: String): Boolean;

    procedure Append;

    property CurrentIndex: Integer read fCurrentIndex;
  end;

implementation

{ TMemoryTable }

constructor TMemoryTable.Create;
begin
  inherited Create;
  fGarbageCollector := TGarbageCollector.Create;
end;

destructor TMemoryTable.Destroy;
var
  i: Integer;
begin
  inherited Destroy;

  for i := 0 to fFieldList.Count - 1 do
  begin
    TObject(fFieldList.Items[i]).Free;
    fFieldList.Items[i] := nil;
  end;

  FreeAndNil(fGarbageCollector);
end;

function TMemoryTable.AddStringField(Name, Description: String): Boolean;
var
  lStringField: TStringField;
begin
  if not Assigned(fFieldList) then
  begin
    fFieldList := TList.Create;
    fGarbageCollector.Add(fFieldList);
  end;

  lStringField := TStringField.Create;
  lStringField.Description := Description;
  lStringField.Name := Name;
  fFieldList.Add(lStringField);
end;

function TMemoryTable.AddIntegerField(Name, Description: String): Boolean;
var
  lIntegerField: TIntegerField;
begin
  if not Assigned(fFieldList) then
  begin
    fFieldList := TList.Create;
    fGarbageCollector.Add(fFieldList);
  end;

  lIntegerField := TIntegerField.Create;
  lIntegerField.Description := Description;
  lIntegerField.Name := Name;
  fFieldList.Add(lIntegerField);
end;

procedure TMemoryTable.Append;
var
  lNewData: Integer;
begin

  //lNewData := Length(fFieldList.Items[0]);
end;

end.

