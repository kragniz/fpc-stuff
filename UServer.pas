unit UServer;
//A class defining the behavior of a server
{$mode objfpc} //make sure we can use classes

interface

type
    TServer = class
        private
            _serving : boolean;
            _efficacy : integer;
        public
            constructor create;
            property serving : boolean read _serving;
    end;

implementation

constructor TServer.create;
begin
    _serving := false;
    _efficacy := 100;
end;

end.
