unit UQueueLoop;
//Looping class
{$mode objfpc} //make sure we can use classes

interface

uses
    UUser, UQueue, UServer;
    
type
    TLoop = class
        private
            _userQueue : TQueue;
        public
            constructor create;
    end;

implementation

constructor TLoop.create;
begin
    _userQueue := TQueue.Create;
end;

end.
