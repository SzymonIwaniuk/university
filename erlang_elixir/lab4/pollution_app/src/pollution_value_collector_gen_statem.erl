-module(pollution_value_collector_gen_statem).
-behaviour(gen_statem).

-export([start_link/0, stop/0, set_station/1, add_value/3, store_data/0]).
-export([init/1, callback_mode/0, terminate/3]).
-export([idle/3, collecting/3]).

%% Client API

start_link() ->
    gen_statem:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
    gen_statem:call(?MODULE, stop).

set_station(StationRef) ->
    gen_statem:call(?MODULE, {set_station, StationRef}).

add_value(DateTime, Type, Value) ->
    gen_statem:call(?MODULE, {add_value, DateTime, Type, Value}).

store_data() ->
    gen_statem:call(?MODULE, store_data).

%% gen_statem callbacks

callback_mode() -> state_functions.

init([]) ->
    {ok, idle, #{}}.

%% State: idle - waiting for a station to be selected

idle({call, From}, {set_station, StationRef}, _Data) ->
    {next_state, collecting, #{station => StationRef, values => []},
     [{reply, From, ok}]};

idle({call, From}, stop, _Data) ->
    {stop_and_reply, normal, [{reply, From, ok}]};

idle({call, From}, _Other, _Data) ->
    {keep_state_and_data, [{reply, From, {error, set_station_first}}]}.

%% State: collecting - accumulating measurements for the chosen station

collecting({call, From}, {add_value, DateTime, Type, Value}, #{station := S, values := Vs} = Data) ->
    {keep_state, Data#{values => [{DateTime, Type, Value} | Vs]},
     [{reply, From, ok}]};

collecting({call, From}, store_data, #{station := Station, values := Values}) ->
    lists:foreach(
        fun({DateTime, Type, Value}) ->
            pollution_gen_server:add_value(Station, DateTime, Type, Value)
        end,
        Values
    ),
    {next_state, idle, #{}, [{reply, From, ok}]};

collecting({call, From}, stop, _Data) ->
    {stop_and_reply, normal, [{reply, From, ok}]};

collecting({call, From}, {set_station, _}, _Data) ->
    {keep_state_and_data, [{reply, From, {error, store_data_first}}]}.

terminate(_Reason, _State, _Data) ->
    ok.
