unit UQueueLoop;
//Looping class
{$mode objfpc} //make sure we can use classes

interface

uses
    UUser, UQueue, UServer;
    
type
    TLoop = class
        private
            _serving : boolean;
        public
            constructor create;
            property serveTime : boolean read _serving;
    end;

implementation

constructor TLoop.create;
begin
    _serving := false;
end;

end.
