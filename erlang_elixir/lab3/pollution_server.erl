-module(pollution_server).
-export([
    start/0,
    stop/0,
    init/0,
    add_station/2,
    add_value/4,
    remove_value/3,
    get_one_value/3,
    get_station_mean/2,
    get_station_min/2,
    get_daily_mean/2,
    get_area_mean/3
]).

start() ->
    register(pollution_server, spawn(?MODULE, init, [])).

init() ->
    loop(pollution:create_monitor()).

stop() ->
    pollution_server ! {stop, self()},
    receive
        ok -> ok
    after 1000 -> {error, timeout}
    end.

%% internal message loop, holds the monitor as its state
loop(Monitor) ->
    receive
        {stop, Pid} ->
            Pid ! ok;
        {request, Pid, Request} ->
            {Reply, NewMonitor} = handle(Request, Monitor),
            Pid ! {reply, Reply},
            loop(NewMonitor)
    end.

%% dispatches each request to the corresponding pollution function
handle({add_station, Name, Coords}, Monitor) ->
    Result = pollution:add_station(Name, Coords, Monitor),
    case Result of
        {error, _} -> {Result, Monitor};
        Updated    -> {ok, Updated}
    end;

handle({add_value, StationRef, DateTime, Type, Value}, Monitor) ->
    Result = pollution:add_value(StationRef, DateTime, Type, Value, Monitor),
    case Result of
        {error, _} -> {Result, Monitor};
        Updated    -> {ok, Updated}
    end;

handle({remove_value, StationRef, DateTime, Type}, Monitor) ->
    Result = pollution:remove_value(StationRef, DateTime, Type, Monitor),
    case Result of
        {error, _} -> {Result, Monitor};
        Updated    -> {ok, Updated}
    end;

handle({get_one_value, StationRef, DateTime, Type}, Monitor) ->
    {pollution:get_one_value(StationRef, DateTime, Type, Monitor), Monitor};

handle({get_station_mean, StationRef, Type}, Monitor) ->
    {pollution:get_station_mean(StationRef, Type, Monitor), Monitor};

handle({get_station_min, StationRef, Type}, Monitor) ->
    {pollution:get_station_min(StationRef, Type, Monitor), Monitor};

handle({get_daily_mean, Type, Date}, Monitor) ->
    {pollution:get_daily_mean(Type, Date, Monitor), Monitor};
    
handle({get_area_mean, Type, Center, Radius}, Monitor) ->
    {pollution:get_area_mean(Type, Center, Radius, Monitor), Monitor}.

%% sends a request to the server and waits for the reply
call(Request) ->
    pollution_server ! {request, self(), Request},
    receive
        {reply, Reply} -> Reply
    end.

%% API
add_station(Name, Coords) ->
    call({add_station, Name, Coords}).

add_value(StationRef, DateTime, Type, Value) ->
    call({add_value, StationRef, DateTime, Type, Value}).

remove_value(StationRef, DateTime, Type) ->
    call({remove_value, StationRef, DateTime, Type}).

get_one_value(StationRef, DateTime, Type) ->
    call({get_one_value, StationRef, DateTime, Type}).

get_station_mean(StationRef, Type) ->
    call({get_station_mean, StationRef, Type}).

get_station_min(StationRef, Type) ->
    call({get_station_min, StationRef, Type}).

get_daily_mean(Type, Date) ->
    call({get_daily_mean, Type, Date}).

get_area_mean(Type, Center, Radius) ->
    call({get_area_mean, Type, Center, Radius}).
