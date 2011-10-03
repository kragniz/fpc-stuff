program testUQueue;

uses UQueue;

var
    queue : TQueue;
begin
    queue := TQueue.create;
    queue.add(123);
    queue.add(543);
    queue.display;
    writeln('done')
end.
