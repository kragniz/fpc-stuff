unit UQueue;
//A class defining the behavior of a queue
{$mode objfpc} //make sure we can use classes

interface

Uses
    UUser;
    
type
    PNode =^ Tnode;

    TNode = record
        data : TObject; //make each node contain a TObject
        Next : PNode;
    end;

    TQueue = class
    private
        _First, fLast:PNode;
        _Length : integer;
        function _GetFirst : TObject;    //get data from first node
    public
        constructor create;
        destructor destroy; override;
        procedure add(personObject : TObject);
        function remove : TObject;
        function isEmpty : boolean;
        property length : integer read _Length;
        property first : TObject read _GetFirst;
        function display : string;
    end;

implementation

{ TQueue }

procedure TQueue.Add(personObject : TObject);
//add a new object to the rear of the queue
var
    Newitem : PNode;
begin
    new(NewItem);
    NewItem^.data := TObject(personObject);
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

function TQueue._GetFirst : TObject;
//return the first object in the queue
begin
 if not IsEmpty then
     result := _First^.data;
end;

function TQueue.IsEmpty : boolean;
//return true if the queue is empty
begin
    result := _First = nil;
end;

function TQueue.Remove: TObject;
//remove the object at the front of the queue
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
//used for debugging - broken
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
		//a bit messy: convert back to TUser
		writeln(TUser(p^.data).serveTime);
		p := _First^.next;
    end;
	result := '';
end;


end.
