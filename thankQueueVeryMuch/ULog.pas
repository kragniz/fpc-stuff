unit ULog;

{$mode objfpc}

interface

uses
    SysUtils, UStack;
    
type
    TLog = class
        private
			//_currentTime : integer;
            _logStack : TStack;
        public
            constructor create;
            procedure logEvent(event : string);
    end;

implementation

constructor TLog.create;
begin
    writeln('object created');
end;

procedure TLog.logEvent(event : string);
begin
    writeln('logged');
end;

end.
