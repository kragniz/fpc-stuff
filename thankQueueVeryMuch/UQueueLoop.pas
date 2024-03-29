unit UQueueLoop;
//Looping class
{$mode objfpc}

	
interface

uses
    UUser, UQueue, UServer, UTime, ULog;
    
type
    TLoop = class
        private
		    _userProb : integer;
			_userMaxServeTime : integer;
            _userQueue : TQueue;
			_time : TTime;
			procedure addUser;
            procedure serveUser;

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
    _time := TTime.create;
end;

procedure TLoop.loop;
var 
    time, i : integer; //seconds
begin
    time := 60*60*9; //hard-coded?
    for i := 1 to time do
	begin
        _time.inc;
		if random(_userProb) = 1 then
		begin
		    writeln('added user @ time ' + _time.prettyTime);
			addUser;
		end;
        if not _userQueue.isEmpty then
            serveUser;
	end;
	//_userQueue.display;
end;

procedure TLoop.serveUser;
begin
    TUser(_userQueue.first).beingServed; //serve the user for one second
    
    if TUser(_userQueue.first).served then
    begin
        _userQueue.remove;
        writeln('removed user');
    end;
end;

procedure TLoop.addUser;
var
    serveTime : integer;
	user : TUser;
begin
   // writeln('added user');
    serveTime := random(_userMaxServeTime);
	user := TUser.create(serveTime);
	_userQueue.add(user);
end;

end.
