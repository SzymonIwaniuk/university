defmodule Pollutiondb.Station do
  use Ecto.Schema
  import Ecto.Query
  alias Pollutiondb.Repo

  schema "stations" do
    field :name, :string
    field :lon, :float
    field :lat, :float
    has_many :readings, Pollutiondb.Reading
  end

  def add(name, lon, lat) do
    %Pollutiondb.Station{name: name, lon: lon, lat: lat}
    |> Repo.insert()
  end

  def get_all() do
    Repo.all(Pollutiondb.Station)
  end

  def get_by_id(id) do
    Repo.get(Pollutiondb.Station, id)
  end

  def remove(station) do
    Repo.delete(station)
  end

  def find_by_name(name) do
    Repo.all(from s in Pollutiondb.Station, where: s.name == ^name)
  end

  def find_by_location(lon, lat) do
    from(s in Pollutiondb.Station,
      where: s.lon == ^lon,
      where: s.lat == ^lat
    )
    |> Repo.all()
  end

  def update_name(station, new_name) do
    Ecto.Changeset.cast(station, %{name: new_name}, [:name])
    |> Ecto.Changeset.validate_required([:name])
    |> Repo.update()
  end
end
