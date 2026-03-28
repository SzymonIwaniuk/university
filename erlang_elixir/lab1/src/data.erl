-module(data).
-export([generate_data/0]).

% {"Krakow", date(), time(), #{pm10 => 42, pm25 => 20}}
generate_data() ->
    [
        {"ul. Zloty Rog", {2026, 3, 10}, {8, 15, 22}, #{pm10 => 4, temperature => 5}},
        {"Rynek Glowny", {2026, 3, 11}, {12, 5, 10}, #{pm25 => 2, humidity => 8, pm1 => 1}},
        {"os. Piastow", {2026, 3, 12}, {18, 45, 0}, #{pm01 => 6, pm4 => 8, pressure => 5}},
        {"Aleja Krasinskiego", {2026, 3, 13}, {22, 10, 33}, #{pm25 => 4, humidity => 7}},
        {"ul. Pollanki", {2026, 3, 14}, {7, 30, 0}, #{pm10 => 5, pm1 => 4, temperature => 8}},
        {"ul. Lusinska", {2026, 3, 15}, {14, 20, 15}, #{pressure => 3, pm10 => 7}},
        {"ul. Dietla", {2026, 3, 16}, {9, 0, 45}, #{pm4 => 9, pm01 => 1, humidity => 6}},
        {"ul. Jaskrowa", {2026, 3, 17}, {11, 11, 11}, #{pm25 => 2, temperature => 4}},
        {"ul. Bujaka", {2026, 3, 18}, {16, 50, 5}, #{pm10 => 1, pm25 => 8, pm4 => 3}},
        {"ul. Bulwarowa", {2026, 3, 19}, {20, 22, 18}, #{pm1 => 5, humidity => 10, pm10 => 3}},
        {"Rynek Glowny", {2026, 3, 20}, {6, 40, 50}, #{pm10 => 8, temperature => 2, pm01 => 7}},
        {"Aleja Krasinskiego", {2026, 3, 21}, {10, 15, 30}, #{pressure => 6, humidity => 3}},
        {"ul. Zloty Rog", {2026, 3, 22}, {13, 5, 44}, #{pm4 => 2, pm25 => 9, pm1 => 6}},
        {"ul. Dietla", {2026, 3, 23}, {17, 30, 20}, #{temperature => 1, pm10 => 6}},
        {"os. Piastow", {2026, 3, 24}, {19, 45, 10}, #{pm10 => 3, pressure => 8, pm01 => 2}},
        {"ul. Lusinska", {2026, 3, 25}, {21, 55, 5}, #{pm25 => 5, pm4 => 7, temperature => 9}},
        {"ul. Jaskrowa", {2026, 3, 26}, {8, 20, 40}, #{pm10 => 6, pm1 => 3, humidity => 5}},
        {"ul. Bulwarowa", {2026, 3, 27}, {12, 35, 15}, #{pressure => 4, pm25 => 1, pm01 => 8}},
        {"ul. Pollanki", {2026, 3, 28}, {15, 10, 55}, #{humidity => 9, temperature => 6, pm4 => 5}},
        {"ul. Bujaka", {2026, 3, 29}, {23, 1, 12}, #{pm10 => 2, pm1 => 8, pressure => 10}}
    ].
