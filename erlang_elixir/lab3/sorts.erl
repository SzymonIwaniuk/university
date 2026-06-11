-module(sorts).
-export([less_than/2, grt_eq_than/2, qs/1, sort_lists/1, random_elems/3, run_benchmarks/0]).

less_than(List, Args) ->
    [X || X <- List, X < Args].

grt_eq_than(List, Args) ->
    [X || X <- List, X >= Args].

qs([]) ->
    [];
qs([E]) ->
    [E];
qs([Pivot | Tail]) ->
    qs(less_than(Tail, Pivot)) ++ [Pivot] ++ qs(grt_eq_than(Tail, Pivot)).

sort_lists(Lists) ->
    [qs(L) || L <- Lists].

random_elems(0, _, _) ->
    [];
random_elems(N, Min, Max) ->
    [rand:uniform(Max - Min + 1) + Min - 1 | random_elems(N - 1, Min, Max)].

run_benchmarks() ->
    Lists = [random_elems(10000, 1, 10000) || _ <- lists:seq(1, 1000)],
    {TimeUs, _SortedLists} = timer:tc(?MODULE, sort_lists, [Lists]),
    io:format("~p~n", [TimeUs]).

qs_proc(L, Pid) -> Pid ! qs(L).

sort_lists_proc(LL) ->
	Pids = [spawn(sorts, qs, [L, self()])] || L <- LL],
	[receive M -> M end || _Pid <- Pids].
