-module(myLists).
-export([contains/2, duplicateElements/1, sumFloats/1, sumFloats2/2]).

contains([], _) -> false;
contains([V | _], V) -> true;
contains([_ | T], V) -> contains(T, V).


duplicateElements([]) -> [];
duplicateElements([H | T]) -> [H, H] ++ duplicateElements(T).

sumFloats([]) -> 0;
sumFloats([H | T]) ->
	case is_float(H) of
		true -> H + sumFloats(T);
		false -> sumFloats(T)
	end.


sumFloats2([], Acc) -> Acc;
sumFloats2([H | T], Acc) ->
	case is_float(H) of
		true -> sumFloats2(T, Acc + H);
		false -> sumFloats2(T, Acc)
	end.
