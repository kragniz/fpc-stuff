unit UServer;
//A class defining the behavior of a server
{$mode objfpc} //make sure we can use classes

interface

type
    TServer = class
        private
            _serving : boolean;
        public
            constructor create;
            property serveTime : boolean read _serving;
    end;

implementation

constructor TServer.create;
begin
    _serving := false;
end;

end.
