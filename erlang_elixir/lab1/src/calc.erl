-module(calc).
-export([
    number_of_readings/2, calculate_min_and_max/2, calculate_mean/2, is_valid_type/1, get_values/2
]).

% {"Krakow", date(), time(), #{pm10 => 42, pm25 => 20}}
% helpers
is_valid_type(Type) ->
    lists:member(Type, [pm10, pm25, pm4, pm1, pm01, humidity, temperature, pressure]).

get_values([], _Type) ->
    [];
get_values([{_, _, _, Sensors} | T], Type) ->
    case maps:find(Type, Sensors) of
        {ok, Value} ->
            [Value | get_values(T, Type)];
        error ->
            get_values(T, Type)
    end.

number_of_readings([], _Date) -> 0;
number_of_readings([{_, Date, _, _} | T], Date) -> number_of_readings(T, Date) + 1;
number_of_readings([_ | T], Date) -> number_of_readings(T, Date).

calculate_min_and_max([], _Type) ->
    {0.0, 0.0};
calculate_min_and_max(Readings, Type) ->
    case is_valid_type(Type) of
        false ->
            {error, invalid_type};
        true ->
            Values = get_values(Readings, Type),

            case Values of
                [] -> {0.0, 0.0};
                _ -> {lists:min(Values), lists:max(Values)}
            end
    end.

calculate_mean([], _Type) ->
    0.0;
calculate_mean(Readings, Type) ->
    case is_valid_type(Type) of
        false ->
            {error, invalid_type};
        true ->
            Values = get_values(Readings, Type),

            case Values of
                [] -> 0.0;
                _ -> lists:sum(Values) / length(Values)
            end
    end.
