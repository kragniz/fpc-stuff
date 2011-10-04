program testUQueue;

uses UQueue, UUser, UQueueLoop, UTime;

var
    queue : TQueue;
	looper : TLoop;
    user1, user2 : TUser;
begin
    randomize;
    {queue := TQueue.create;
    user1 := TUser.create(123);
    user2 := TUser.create(543);
    queue.add(user1);
    queue.add(user2);
    queue.display;}
	looper := TLoop.create;
	looper.loop;
    writeln('done on Linux :)')
end.
