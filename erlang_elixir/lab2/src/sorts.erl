-module(sorts).
-export([
    less_than/2, grt_eq_than/2, qs/1, random_elems/3, compare_speeds/3
]).

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

random_elems(0, _Min, _Max) ->
    [];
random_elems(N, Min, Max) ->
    [rand:uniform(Max - Min + 1) + Min - 1 || _ <- lists:seq(1, N)].

compare_speeds([], _Fun1, _Fun2) ->
    {error, empty_list};
compare_speeds(List, Fun1, Fun2) ->
    {Time1, _} = timer:tc(Fun1, [List]),
    {Time2, _} = timer:tc(Fun2, [List]),
    io:format("~w ~w \n~w ~w ~n", [Fun1, Time1, Fun2, Time2]).

F = fun(X) ->
    case X rem 3 of
        true -> 1;
        false -> 0
    end
end.

FF = fun (List) ->
             lists:foldl(F, 0, List).
