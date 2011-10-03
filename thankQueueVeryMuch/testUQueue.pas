program testUQueue;

uses UQueue, UUser;

var
    queue : TQueue;
    user1, user2 : TUser;
begin
    queue := TQueue.create;
    user1 := TUser.create(123);
    user2 := TUser.create(543);
    queue.add(user1);
    queue.add(user2);
    queue.display;
    writeln('done')
end.
