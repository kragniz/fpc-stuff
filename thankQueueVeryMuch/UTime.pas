unit UTime;
//Time class
{$mode objfpc}
	
interface

uses
    SysUtils; //needed for intostr()
    
type
    TTime = class
        private
			_currentTime : integer;
        public
            constructor create;
			procedure inc;
            function currentTime : integer;
            function prettyTime : string;
    end;

implementation

constructor TTime.create;
begin
    _currentTime := 0;
end;

function TTime.currentTime : integer;
//return the current time in seconds
begin
    result := _currentTime;
end;

procedure TTime.inc;
//increment the time by one second
begin
    _currentTime := _currentTime + 1;
end;

function TTime.prettyTime : string;
//return a nice string representation of the time (hh:mm:ss)
begin
    result := inttostr(_currentTime div 3600) + ':' +
              inttostr((_currentTime div 60) mod 60) + ':' +
              inttostr(_currentTime mod 60);
end;

end.
