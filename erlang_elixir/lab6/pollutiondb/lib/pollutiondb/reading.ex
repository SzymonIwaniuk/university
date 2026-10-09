defmodule Pollutiondb.Reading do
  use Ecto.Schema
  import Ecto.Query
  alias Pollutiondb.Repo

  schema "readings" do
    field :date, :date
    field :time, :time
    field :type, :string
    field :value, :float
    belongs_to :station, Pollutiondb.Station
  end

  def add_now(station, type, value) do
    %Pollutiondb.Reading{
      date: Date.utc_today(),
      time: Time.utc_now(),
      type: type,
      value: value,
      station_id: station.id
    }
    |> Repo.insert()
  end

  def add(station, date, time, type, value) do
    %Pollutiondb.Reading{
      date: date,
      time: time,
      type: type,
      value: value,
      station_id: station.id
    }
    |> Repo.insert()
  end

  def find_by_date(date) do
    from(r in Pollutiondb.Reading, where: r.date == ^date)
    |> Repo.all()
  end

  def get_all() do
    Repo.all(Pollutiondb.Reading)
  end
end
