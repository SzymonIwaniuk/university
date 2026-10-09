%%%-------------------------------------------------------------------
%% @doc pollution_app top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(pollution_app_sup).

-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    SupFlags = #{
        strategy  => one_for_one,
        intensity => 5,
        period    => 10
    },
    ChildSpecs = [
        #{
            id      => pollution_gen_server,
            start   => {pollution_gen_server, start_link, []},
            restart => permanent,
            type    => worker
        },
        #{
            id      => pollution_value_collector_gen_statem,
            start   => {pollution_value_collector_gen_statem, start_link, []},
            restart => permanent,
            type    => worker
        }
    ],
    {ok, {SupFlags, ChildSpecs}}.
