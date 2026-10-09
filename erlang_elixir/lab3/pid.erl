-module(proc_create).
-export([pass/0, reply/0]).

pass(Count) ->
    Pid = spawn(?MODULE, pass, []),
    Pid ! {self(), Count},
    receive
        _ -> ok
    end.

pass() ->
	receive
		{ParentPid, Count} when
			  Pid = spawn()
			
