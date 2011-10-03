unit ULStack;
//defines a linked-list implementation of a stack
interface
type
  TStack=class

    type PNode=^TNode;
    TNode=record
      Data:string;
      next:Pnode;
    end;

    private
      FTop:Pnode;
      Fsize:integer;
      function GetTop:string;  //inspect top item but leave in place
    public
      constructor Create;
      destructor Destroy;
      procedure Push(s:string);
      function Pop:string;
      function IsEmpty:boolean;
      property Size: integer read fsize;
      property Top:string read GetTop;
  end;
implementation

{ TStack }

constructor TStack.Create;
begin
  inherited;
  fTop:=nil;
  fSize:=0;
end;

destructor TStack.Destroy;
var
  Scrap:PNode;
begin
  while fTop<>nil do
  begin
    scrap:=fTop;
    fTop:=fTop^.Next;
    dispose(scrap);
  end;
  fSize:=0;

end;

function TStack.GetTop: string; //inspect top item but leave in place
begin
  if not IsEmpty then
   result:=fTop^.data;
end;

function TStack.IsEmpty: boolean;
begin
  result:=fTop=nil;
end;

function TStack.Pop: string;
var
  scrap:PNode;
  begin
  if not IsEmpty then
  begin
    result:=fTop^.data;
    scrap:=fTop;
    FTop:=fTop^.Next;
    dispose(scrap);
    dec(FSize);
  end;

end;

procedure TStack.Push(s: string);
var
  Newitem:PNode;
begin
  new(NewItem);
  NewItem^.data:=s;
  NewItem^.next:=FTop;
  fTop:=NewItem;
  inc(fSize);
end;

end.
