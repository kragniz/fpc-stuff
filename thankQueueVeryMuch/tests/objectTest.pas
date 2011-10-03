program ObjectTest;
{$mode objfpc} //use objects

Type
TestClass = Class
    constructor create;
    function outputValue(i:integer) : integer;
end;

var
    tc : TestClass;

constructor TestClass.create;
var
    i : integer;
begin
    i := 5;
    writeln(i);
end;

function TestClass.outputValue(i:integer) : integer;
begin
    result := i*2;
end;

begin
    tc := tc.create; 
    writeln('hello');
    writeln(tc.outputValue(5));
end.
