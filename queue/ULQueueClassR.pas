unit ULQueueClassR;
 //class for Linked List Queue storing strings
 //using pointer to rear
interface

type
  PNode=^Tnode;

  TNode=record
    data:string;
    Next:PNode;
  end;

  TLQueue=class
  private
    fFront, fRear:PNode;   //pointer to first and last nodes
    fLength:integer;
    function GetFront:string;  //get data from first node
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(s:string);
    function Remove:string;
    function IsEmpty:boolean;
    property Length: integer read fLength;
    property Front:string read GetFront;
  end;

implementation

{ TLQueue }

procedure TLQueue.Add(s: string);
var
  Newitem:PNode;
begin
  new(NewItem);
  NewItem^.data:=s;
  NewItem^.next:=nil;
  if IsEmpty then
     fFront:=NewItem
  else
     fRear^.Next:=NewItem;
  fRear:=NewItem;
  inc(fLength);
end;

constructor TLQueue.Create;
begin
  inherited;
  fFront:=nil;
  fRear:=nil;
  fLength:=0;
end;

destructor TLQueue.Destroy;
var
  Scrap:PNode;
begin
  while fFront<>nil do       //delete all nodes to avoid memory leak
  begin
    scrap:=fFront;
    fFront:=fFront^.Next;
    dispose(scrap);
  end;
  fLength:=0;
end;

function TLQueue.GetFront: string;
begin
 if not IsEmpty then
   result:=fFront^.data;
end;

function TLQueue.IsEmpty: boolean;
begin
  result:=fFront=nil;
end;

function TLQueue.Remove: string;
var
  scrap:PNode;
  begin
  if not IsEmpty then
  begin
    result:=fFront^.data;
    scrap:=fFront;
    FFront:=fFront^.Next;
    dispose(scrap);
    dec(FLength);
    if IsEmpty then   //if we've just removed the last item
      fRear:=nil;     //set rear pointer to nil
  end;

end;

end.
