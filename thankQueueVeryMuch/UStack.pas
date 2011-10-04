unit UStack;

{$mode objfpc}

interface

type
    PNode = ^TNode;
    TNode = record
      data : string;
      next : Pnode;
    end;
    
  TStack = class
    private
      _top : Pnode;
      _size : integer;
      function GetTop : string;
    public
      constructor Create;
      destructor Destroy;
      procedure Push(s : string);
      function Pop : string;
      function IsEmpty : boolean;
      property Size : integer read _size;
      property Top : string read GetTop;
  end;
  
implementation

constructor TStack.Create;
begin
  inherited;
  _top := nil;
  _size := 0;
end;

destructor TStack.Destroy;
var
  Scrap : PNode;
begin
  while _top <> nil do
  begin
    scrap := _top;
    _top := _top^.Next;
    dispose(scrap);
  end;
  _size := 0;

end;

function TStack.GetTop : string;
begin
  if not IsEmpty then
   result := _top^.data;
end;

function TStack.IsEmpty : boolean;
begin
  result := _top = nil;
end;

function TStack.Pop : string;
var
  scrap : PNode;
  begin
  if not IsEmpty then
  begin
    result := _top^.data;
    scrap := _top;
    _top := _top^.Next;
    dispose(scrap);
    dec(_size);
  end;

end;

procedure TStack.Push(s : string);
var
  Newitem : PNode;
begin
  new(NewItem);
  NewItem^.data := s;
  NewItem^.next := _top;
  _top := NewItem;
  inc(_size);
end;

end.
