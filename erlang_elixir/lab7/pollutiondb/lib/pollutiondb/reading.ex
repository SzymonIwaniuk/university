defmodule Pollutiondb.Reading do
  use Ecto.Schema
  import Ecto.Query
  alias Pollutiondb.Repo

  schema "readings" do
    field :datetime, :naive_datetime
    field :type, :string
    field :value, :float
    belongs_to :station, Pollutiondb.Station
  end

  def add(datetime, type, value, station_id) do
    %Pollutiondb.Reading{
      datetime: datetime,
      type: type,
      value: value,
      station_id: station_id
    }
    |> Repo.insert()
  end

  def get_all() do
    Repo.all(Pollutiondb.Reading)
  end

  def count() do
    Repo.aggregate(Pollutiondb.Reading, :count, :id)
  end

  def get_by_station(station_id) do
    Repo.all(from r in Pollutiondb.Reading, where: r.station_id == ^station_id)
  end

  def next_datetime(station_id, cursor) do
    query =
      from r in Pollutiondb.Reading,
        where: r.station_id == ^station_id,
        order_by: r.datetime,
        limit: 1,
        select: r.datetime

    query =
      if cursor do
        where(query, [r], r.datetime > ^cursor)
      else
        query
      end

    Repo.one(query)
  end

  def at_datetime(station_id, datetime) do
    Repo.all(
      from r in Pollutiondb.Reading,
        where: r.station_id == ^station_id and r.datetime == ^datetime
    )
  end
end
