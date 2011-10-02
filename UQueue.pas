unit UQueue;
//A class defining the behavior of a queue
{$mode objfpc} //make sure we can use classes

interface

type
    PNode =^ Tnode;

    TNode = record
        data : string;
        Next : PNode;
    end;

    TQueue = class
    private
        fFirst, fLast:PNode;
        fLength : integer;
        function GetFirst : string;    //get data from first node
    public
        constructor Create;
        destructor Destroy; override;
        procedure Add(s : string);
        function Remove : string;
        function IsEmpty : boolean;
        property Length : integer read fLength;
        property First :string read GetFirst;
    end;

implementation

{ TQueue }

procedure TQueue.Add(s : string);
var
    Newitem : PNode;
begin
    new(NewItem);
    NewItem^.data := s;
    NewItem^.next := nil;
    if IsEmpty then
         fFirst := NewItem
    else
         fLast^.Next := NewItem;
    fLast := NewItem;
    inc(fLength);
end;

constructor TQueue.Create;
begin
    inherited;
    fFirst := nil;
    fLast := nil;
    fLength := 0;
end;

destructor TQueue.Destroy;
var
    p:PNode; //pointer we want to remove
begin
    while fFirst <> nil do
    begin
        p := fFirst;
        fFirst := fFirst^.Next;
        dispose(p);
    end;
    fLength := 0;
end;

function TQueue.GetFirst : string;
begin
 if not IsEmpty then
     result := fFirst^.data;
end;

function TQueue.IsEmpty : boolean;
begin
    result := fFirst = nil;
end;

function TQueue.Remove: string;
var
    p:PNode; //pointer we want to remove
begin
    if not IsEmpty then
    begin
        result := fFirst^.data;
        p := fFirst;
        fFirst := fFirst^.Next;
        dispose(p);
        dec(FLength);
        if IsEmpty then
            fLast := nil;
    end;
end;

end.
