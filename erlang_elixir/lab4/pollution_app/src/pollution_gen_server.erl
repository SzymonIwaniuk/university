-module(pollution_gen_server).
-behaviour(gen_server).

-export([start_link/0, stop/0, crash/0]).
-export([add_station/2, add_value/4, remove_value/3,
         get_one_value/3, get_station_mean/2, get_station_min/2,
         get_daily_mean/2, get_area_mean/3]).
-export([init/1, handle_call/3, handle_cast/2, terminate/2]).

%% Client API

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
    gen_server:call(?MODULE, terminate).

crash() ->
    gen_server:cast(?MODULE, crash).

add_station(Name, Coords) ->
    gen_server:call(?MODULE, {add_station, Name, Coords}).

add_value(StationRef, DateTime, Type, Value) ->
    gen_server:call(?MODULE, {add_value, StationRef, DateTime, Type, Value}).

remove_value(StationRef, DateTime, Type) ->
    gen_server:call(?MODULE, {remove_value, StationRef, DateTime, Type}).

get_one_value(StationRef, DateTime, Type) ->
    gen_server:call(?MODULE, {get_one_value, StationRef, DateTime, Type}).

get_station_mean(StationRef, Type) ->
    gen_server:call(?MODULE, {get_station_mean, StationRef, Type}).

get_station_min(StationRef, Type) ->
    gen_server:call(?MODULE, {get_station_min, StationRef, Type}).

get_daily_mean(Type, Date) ->
    gen_server:call(?MODULE, {get_daily_mean, Type, Date}).

get_area_mean(Type, Center, Radius) ->
    gen_server:call(?MODULE, {get_area_mean, Type, Center, Radius}).

%% Server callbacks

init([]) ->
    {ok, pollution:create_monitor()}.

handle_call({add_station, Name, Coords}, _From, Monitor) ->
    case pollution:add_station(Name, Coords, Monitor) of
        {error, _} = Err -> {reply, Err, Monitor};
        NewMonitor       -> {reply, ok, NewMonitor}
    end;

handle_call({add_value, StationRef, DateTime, Type, Value}, _From, Monitor) ->
    case pollution:add_value(StationRef, DateTime, Type, Value, Monitor) of
        {error, _} = Err -> {reply, Err, Monitor};
        NewMonitor       -> {reply, ok, NewMonitor}
    end;

handle_call({remove_value, StationRef, DateTime, Type}, _From, Monitor) ->
    case pollution:remove_value(StationRef, DateTime, Type, Monitor) of
        {error, _} = Err -> {reply, Err, Monitor};
        NewMonitor       -> {reply, ok, NewMonitor}
    end;

handle_call({get_one_value, StationRef, DateTime, Type}, _From, Monitor) ->
    {reply, pollution:get_one_value(StationRef, DateTime, Type, Monitor), Monitor};

handle_call({get_station_mean, StationRef, Type}, _From, Monitor) ->
    {reply, pollution:get_station_mean(StationRef, Type, Monitor), Monitor};

handle_call({get_station_min, StationRef, Type}, _From, Monitor) ->
    {reply, pollution:get_station_min(StationRef, Type, Monitor), Monitor};

handle_call({get_daily_mean, Type, Date}, _From, Monitor) ->
    {reply, pollution:get_daily_mean(Type, Date, Monitor), Monitor};

handle_call({get_area_mean, Type, Center, Radius}, _From, Monitor) ->
    {reply, pollution:get_area_mean(Type, Center, Radius, Monitor), Monitor};

handle_call(terminate, _From, Monitor) ->
    {stop, normal, ok, Monitor}.

handle_cast(crash, _Monitor) ->
    no:exist().

terminate(normal, _Monitor) ->
    ok;
terminate(Reason, _Monitor) ->
    io:format("pollution_gen_server terminated: ~p~n", [Reason]),
    ok.
