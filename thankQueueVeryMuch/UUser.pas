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

end.
