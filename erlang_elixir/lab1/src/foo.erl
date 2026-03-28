-module(foo).
-export([power/2]).


power(_, 0) -> 1;
power(A, 1) -> A;
power(A, B) -> A * power(A, B - 1).

