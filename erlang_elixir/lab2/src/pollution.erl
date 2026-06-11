%%%-------------------------------------------------------------------
%%% @author Szymon Iwaniuk
%%% @copyright (C) 2026, Szymon Iwaniuk
%%% @doc
%%%
%%% @end
%%% Created : 30. Apr 2026 12:37
%%%-------------------------------------------------------------------
-module(pollution).
-author("Szymon Iwaniuk").

-export([
    create_monitor/0,
    add_station/3,
    add_value/5,
    remove_value/4,
    get_one_value/4,
    get_station_mean/3,
    get_station_min/3,
    get_daily_mean/3,
    get_area_mean/4
]).

-record(station, {name, coordinates, measurements}).
-record(monitor, {stations}).

%% example struct:
%% #monitor{
%%    stations = [
%%        #station{
%%            name = "Aleja Slowackiego",
%%            coordinates = {50.2345, 18.3445},
%%            measurements = #{{{{2024,4,1},{12,0,0}}, "PM10"} => 59}
%%        }
%%    ]
%% }

create_monitor() ->
    #monitor{stations = []}.

%%% helpers
mean(Values) ->
    lists:foldl(fun(V, Acc) -> V + Acc end, 0, Values) / length(Values).

distance({Lat1, Lon1}, {Lat2, Lon2}) ->
    math:sqrt(math:pow(Lat1 - Lat2, 2) + math:pow(Lon1 - Lon2, 2)).

stations_in_area(Center, Radius, Stations) ->
    [S || S = #station{coordinates = C} <- Stations, distance(C, Center) =< Radius].

%%% API.
get_station(Name, #monitor{stations = Stations}) when is_list(Name) ->
    case lists:keyfind(Name, #station.name, Stations) of
        false   -> {error, station_not_found};
        Station -> {ok, Station}
    end;
get_station({_, _} = Coords, #monitor{stations = Stations}) ->
    case lists:keyfind(Coords, #station.coordinates, Stations) of
        false   -> {error, station_not_found};
        Station -> {ok, Station}
    end.

add_station(Name, Coords, #monitor{stations = Stations} = Monitor) ->
    case {lists:keymember(Name, #station.name, Stations), lists:keymember(Coords, #station.coordinates, Stations)} of
        {true, _} -> {error, station_name_already_exists};
        {_, true} -> {error, station_coordinates_already_exist};
        _         -> Monitor#monitor{stations = [#station{name = Name, coordinates = Coords, measurements = #{}} | Stations]}
    end.

add_value(StationRef, DateTime, Type, Value, #monitor{stations = Stations} = Monitor) ->
    case get_station(StationRef, Monitor) of
        {error, Reason} -> 
            {error, Reason};
        {ok, Station = #station{measurements = Measurements}} ->
            Key = {DateTime, Type},
            case maps:is_key(Key, Measurements) of
                true  -> {error, reading_already_exists};
                false ->
                    NewStation = Station#station{measurements = Measurements#{Key => Value}},
                    NewStations = lists:keyreplace(Station#station.name, #station.name, Stations, NewStation),
                    Monitor#monitor{stations = NewStations}
            end
    end.

remove_value(StationRef, DateTime, Type, #monitor{stations = Stations} = Monitor) ->
    case get_station(StationRef, Monitor) of
        {error, Reason} -> 
            {error, Reason};
        {ok, Station = #station{measurements = Measurements}} ->
            Key = {DateTime, Type},
            case maps:is_key(Key, Measurements) of
                false -> {error, reading_not_found};
                true  ->
                    NewStation = Station#station{measurements = maps:remove(Key, Measurements)},
                    NewStations = lists:keyreplace(Station#station.name, #station.name, Stations, NewStation),
                    Monitor#monitor{stations = NewStations}
            end
    end.

get_one_value(StationRef, DateTime, Type, Monitor) ->
    case get_station(StationRef, Monitor) of
        {error, Reason} -> 
            {error, Reason};
        {ok, #station{measurements = Measurements}} ->
            case maps:find({DateTime, Type}, Measurements) of
                {ok, V} -> V;
                error   -> {error, reading_not_found}
            end
    end.

get_station_mean(StationRef, Type, Monitor) ->
    case get_station(StationRef, Monitor) of
        {error, Reason} -> 
            {error, Reason};
        {ok, #station{measurements = Measurements}} ->
            case [V || {_, T} := V <- Measurements, T =:= Type] of
                []     -> {error, no_readings};
                Values -> mean(Values)
            end
    end.

get_station_min(StationRef, Type, Monitor) ->
    case get_station(StationRef, Monitor) of
        {error, Reason} -> 
            {error, Reason};
        {ok, #station{measurements = Measurements}} ->
            case [V || {_, T} := V <- Measurements, T =:= Type] of
                []     -> {error, no_readings};
                Values -> lists:min(Values)
            end
    end.

get_daily_mean(Type, Date, #monitor{stations = Stations}) ->
    Values = [V || #station{measurements = Measurements} <- Stations,
                   {{D, _}, T} := V <- Measurements,
                   D =:= Date, T =:= Type],
    case Values of
        [] -> {error, no_readings};
        _  -> mean(Values)
    end.

get_area_mean(Type, Center, Radius, #monitor{stations = Stations}) ->
    InArea = stations_in_area(Center, Radius, Stations),
    Values = [V || #station{measurements = Measurements} <- InArea,
                   {_, T} := V <- Measurements,
                   T =:= Type],
    case Values of
        [] -> {error, no_readings};
        _  -> mean(Values)
    end.