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
  end;

  TIntegerField = class(TObject)
  private
    Values: TIntegerValues;
  public
    Description: String;
    Name: String;
  end;

  { TMemoryTable }

  TMemoryTable = class(TObject)
  private
    fFieldList: TList;
    fGarbageCollector: TGarbageCollector;
  public
    constructor Create;
    destructor Destroy; override;

    function AddStringField(Name, Description: String): Boolean;
    function AddIntegerField(Name, Description: String): Boolean;

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
    FreeAndNil(fFieldList.Items[i]);

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

end.

