unit UUser;
//A class defining the behavior of a user
{$mode objfpc}

interface

type
    TUser = class
        private
            _serveTime : integer; //the time this user takes to be served
            procedure incServeTime(t : integer);
        public
            constructor create(serveTime : integer);
            procedure getAngry;
            property serveTime : integer read _serveTime;
            procedure beingServed;
            function served : boolean;
    end;

implementation

constructor TUser.create(serveTime : integer);
begin
    _serveTime := serveTime;
end;

procedure TUser.getAngry;
begin
    incServeTime(5); //TODO change this value
end;

procedure TUser.incServeTime(t : integer);
begin
    _serveTime := _serveTime + t;
end;

procedure TUser.beingServed;
begin
    _serveTime := _serveTime - 1;
end;

function TUser.served : boolean;
begin
    return (_serveTime = 0);
end;

end.
