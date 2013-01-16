unit unGarbageCollector;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils; 

type

  { TGarbageCollector }

  TGarbageCollector = class(TObject)
  private
    fGarbageList: TList;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(Garbage: TObject);
  end;

implementation

{ TGarbageCollector }

constructor TGarbageCollector.Create;
begin
  fGarbageList := TList.Create;
end;

destructor TGarbageCollector.Destroy;
var
  i: Integer;
begin
  inherited Destroy;

  for i := 0 to fGarbageList.Count - 1 do
  begin
    if Assigned(fGarbageList.Items[i]) then
      TObject(fGarbageList[i]).Free;
  end;
end;

procedure TGarbageCollector.Add(Garbage: TObject);
begin
  fGarbageList.Add(Garbage);
end;

end.

