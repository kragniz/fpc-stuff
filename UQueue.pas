unit UQueue;
//A class defining the behavior of a queue
{$mode objfpc} //make sure we can use classes

interface

Uses
    UUser;
    
type
    PNode =^ Tnode;

    TNode = record
        data : TUser; //make each node contain a user
        Next : PNode;
    end;

    TQueue = class
    private
        _First, fLast:PNode;
        _Length : integer;
        function GetFirst : TUser;    //get data from first node
    public
        constructor Create;
        destructor Destroy; override;
        procedure Add(serveTime : integer);
        function Remove : TUser;
        function IsEmpty : boolean;
        property Length : integer read _Length;
        property First : TUser read GetFirst;
        function display : string;
    end;

implementation

{ TQueue }

procedure TQueue.Add(serveTime : integer);
var
    Newitem : PNode;
begin
    new(NewItem);
    NewItem^.data := TUser.create(serveTime);
    NewItem^.next := nil;
    if IsEmpty then
         _First := NewItem
    else
         fLast^.Next := NewItem;
    fLast := NewItem;
    inc(_Length);
end;

constructor TQueue.Create;
begin
    inherited;
    _First := nil;
    fLast := nil;
    _Length := 0;
end;

destructor TQueue.Destroy;
var
    p:PNode; //pointer we want to remove
begin
    while _First <> nil do
    begin
        p := _First;
        _First := _First^.Next;
        dispose(p);
    end;
    _Length := 0;
end;

function TQueue.GetFirst : TUser;
begin
 if not IsEmpty then
     result := _First^.data;
end;

function TQueue.IsEmpty : boolean;
begin
    result := _First = nil;
end;

function TQueue.Remove: TUser;
var
    p:PNode; //pointer we want to remove
begin
    if not IsEmpty then
    begin
        result := _First^.data;
        p := _First;
        _First := _First^.Next;
        dispose(p);
        dec(_Length);
        if IsEmpty then
            fLast := nil;
    end;
end;

function TQueue.display : string;
//used for debugging
var
    p : PNode;
    b : boolean;
begin
    p := _First;
    b := true;
    while b do
    begin
        if p^.next = nil then
            b := false;
        writeln(p^.data.serveTime);
        p := _First^.next;

    end;
end;


end.
