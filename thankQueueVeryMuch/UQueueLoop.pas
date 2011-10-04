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
			_currentTime : integer;
			procedure addUser;
        public
            constructor create;
			procedure loop;
    end;

implementation

constructor TLoop.create;
begin
    _userQueue := TQueue.Create;
	_userProb := 10;
	_userMaxServeTime := 150;
end;

procedure TLoop.loop;
var 
    time, i : integer; //seconds
begin
    time := 1000;//60*60*9;
    for i := 1 to time do
	begin
	    //writeln(i);
		//writeln(random(_userProb));
		if random(_userProb) = 1 then
		begin
		    
			addUser;
		end;
	end;
	addUser;
	//_userQueue.display;
end;

procedure TLoop.addUser;
var
    serveTime : integer;
	user : TUser;
begin
    writeln('added user');
    serveTime := random(_userMaxServeTime);
	user := TUser.create(serveTime);
	_userQueue.add(user);
end;

end.
