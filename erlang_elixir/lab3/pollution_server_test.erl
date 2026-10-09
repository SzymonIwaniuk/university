-module(pollution_server_test).
-include_lib("eunit/include/eunit.hrl").

%% setup/teardown ensure fresh state for each test
server_test_() ->
    {foreach,
        fun setup/0,
        fun cleanup/1,
        [
            fun test_add_station/0,
            fun test_add_value/0,
            fun test_remove_value/0,
            fun test_get_one_value/0,
            fun test_get_station_mean/0,
            fun test_get_daily_mean/0,
            fun test_get_area_mean/0
        ]
    }.

setup() ->
    pollution_server:start().

cleanup(_) ->
    pollution_server:stop().

test_add_station() ->
    ?assertEqual(ok, pollution_server:add_station("S1", {1, 1})),
    ?assertEqual(ok, pollution_server:add_station("S2", {1, 2})),
    
    ?assertEqual({error, station_name_already_exists}, pollution_server:add_station("S1", {3, 3})),
    ?assertEqual({error, station_coordinates_already_exist}, pollution_server:add_station("S3", {1, 1})).

test_add_value() ->
    pollution_server:add_station("S1", {1, 1}),
    Time = calendar:local_time(),
    
    ?assertEqual(ok, pollution_server:add_value("S1", Time, "PM10", 50)),
    ?assertEqual({error, reading_already_exists}, pollution_server:add_value("S1", Time, "PM10", 60)),
    ?assertEqual({error, station_not_found}, pollution_server:add_value("S2", Time, "PM10", 50)).

test_remove_value() ->
    pollution_server:add_station("S1", {1, 1}),
    Time = calendar:local_time(),
    pollution_server:add_value("S1", Time, "PM10", 50),
    
    ?assertEqual(ok, pollution_server:remove_value("S1", Time, "PM10")),
    ?assertEqual({error, reading_not_found}, pollution_server:remove_value("S1", Time, "PM10")). 

test_get_one_value() ->
    pollution_server:add_station("S1", {1, 1}),
    Time = calendar:local_time(),
    pollution_server:add_value("S1", Time, "PM10", 50),
    
    ?assertEqual(50, pollution_server:get_one_value("S1", Time, "PM10")),
    ?assertEqual({error, reading_not_found}, pollution_server:get_one_value("S1", Time, "PM2.5")),
    ?assertEqual({error, station_not_found}, pollution_server:get_one_value("GhostStation", Time, "PM10")).

test_get_station_mean() ->
    pollution_server:add_station("S1", {1, 1}),
    pollution_server:add_value("S1", {{2023,1,1}, {10,0,0}}, "PM10", 10),
    pollution_server:add_value("S1", {{2023,1,1}, {11,0,0}}, "PM10", 20),
    
    ?assertEqual(15.0, pollution_server:get_station_mean("S1", "PM10")),
    ?assertEqual({error, no_readings}, pollution_server:get_station_mean("S1", "PM2.5")).

test_get_daily_mean() ->
    pollution_server:add_station("S1", {1, 1}),
    pollution_server:add_station("S2", {2, 2}),
    pollution_server:add_value("S1", {{2023,1,1}, {10,0,0}}, "PM10", 10),
    pollution_server:add_value("S2", {{2023,1,1}, {11,0,0}}, "PM10", 20),
    
    ?assertEqual(15.0, pollution_server:get_daily_mean("PM10", {2023,1,1})),
    ?assertEqual({error, no_readings}, pollution_server:get_daily_mean("PM2.5", {2023,1,1})).

test_get_area_mean() ->
    pollution_server:add_station("S1", {0, 0}),
    pollution_server:add_station("S2", {0, 1}),
    pollution_server:add_station("S3", {0, 5}),
    pollution_server:add_value("S1", {{2023,1,1}, {10,0,0}}, "PM10", 10),
    pollution_server:add_value("S2", {{2023,1,1}, {11,0,0}}, "PM10", 20),
    pollution_server:add_value("S3", {{2023,1,1}, {12,0,0}}, "PM10", 30),
    
    ?assertEqual(15.0, pollution_server:get_area_mean("PM10", {0, 0}, 2.0)),
    ?assertEqual({error, no_readings}, pollution_server:get_area_mean("PM2.5", {0, 0}, 2.0)).