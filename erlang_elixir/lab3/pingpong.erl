-module(pingpong).
-export([start/0, stop/0, play/1, ping/0, pong/0]).

start() ->
	case 
    register(ping, spawn(fun pingpong:ping/0)),
    register(pong, spawn(pingpong, pong, [])).

stop() ->
    spawn(fun() ->
        ping ! stop,
        pong ! stop
    end),
    ok.

play(N) ->
    timer:sleep(100),
    ping ! N.

ping() ->
    receive
        stop ->
            ok;
        N when N > 0 ->
            timer:sleep(100),
            io:format("~p~n", [N - 1]),
            pong ! N - 1,

            ping();
        0 ->
            io:format("ping got 0"),
            ping()
	after 20000
		_ -> ok. 
    
end.

pong() ->
    receive
        stop ->
            ok;
        N when N > 0 ->
            timer:sleep(100),
            io:format("~p~n", [N - 1]),
            ping ! N - 1,
            pong();
        0 ->
            io:format("pong get 0"),
            pong()
	after 20000
		_ -> ok. 

    
end.
