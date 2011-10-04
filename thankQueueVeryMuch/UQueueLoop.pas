unit UQueueLoop;
//Looping class
{$mode objfpc} //make sure we can use classes

	
interface

uses
    UUser, UQueue, UServer;
    
type
    TLoop = class
        private
		    _userProb : integer;
			_userMaxServeTime : integer;
            _userQueue : TQueue;
			procedure addUser;
        public
            constructor create;
			procedure loop;
    end;

implementation

constructor TLoop.create;
begin
    _userQueue := TQueue.Create;
	_userProb := 120;
	_userMaxServeTime := 150;
end;

procedure TLoop.loop;
var 
    time, i : integer; //seconds
begin
    time := 60*60*9;
    {for i := 0 to time do
	begin
	    writeln(i);
	end;}
	addUser;
	_userQueue.display;
end;

procedure TLoop.addUser;
var
    serveTime : integer;
	user : TUser;
begin
    serveTime := random(_userMaxServeTime);
	user := TUser.create(serveTime);
	_userQueue.add(user);
end;

end.
