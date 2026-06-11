defmodule Pollutiondb.Loader do
  alias Pollutiondb.{Station, Reading}

  @default_path "data/AirlyData-ALL-50k.csv"
  @default_limit 1_000

  def load(path \\ @default_path, limit \\ @default_limit) do
    rows =
      File.stream!(path)
      |> Stream.take(limit)
      |> Enum.map(&parse_line/1)

    station_map = insert_unique_stations(rows)
    insert_readings(rows, station_map)

    {:ok, length(rows)}
  end

  def load_all(path \\ @default_path) do
    rows =
      File.stream!(path)
      |> Enum.map(&parse_line/1)

    station_map = insert_unique_stations(rows)
    insert_readings(rows, station_map)

    {:ok, length(rows)}
  end

  defp parse_line(line) do
    [datetime_str, type, value_str, station_id, station_name, coords] =
      line
      |> String.trim()
      |> String.split(";")

    [lat_str, lon_str] = String.split(coords, ",")

    {:ok, datetime, _offset} = DateTime.from_iso8601(datetime_str)
    naive_dt = DateTime.to_naive(datetime)
    date = NaiveDateTime.to_date(naive_dt)
    time = NaiveDateTime.to_time(naive_dt)

    %{
      date: date,
      time: time,
      type: type,
      value: parse_float(value_str),
      station_id: station_id,
      station_name: station_name,
      name: "#{station_id}-#{station_name}",
      lat: parse_float(lat_str),
      lon: parse_float(lon_str)
    }
  end

  defp parse_float(str) do
    case Float.parse(str) do
      {val, _} -> val
      :error -> 0.0
    end
  end

  defp insert_unique_stations(rows) do
    rows
    |> Enum.uniq_by(& &1.name)
    |> Enum.reduce(%{}, fn row, acc ->
      station =
        case Station.find_by_name(row.name) do
          [] ->
            {:ok, s} = Station.add(row.name, row.lon, row.lat)
            s

          [s | _] ->
            s
        end

      Map.put(acc, row.name, station)
    end)
  end

  defp insert_readings(rows, station_map) do
    Enum.each(rows, fn row ->
      station = Map.fetch!(station_map, row.name)
      Reading.add(station, row.date, row.time, row.type, row.value)
    end)
  end
end
