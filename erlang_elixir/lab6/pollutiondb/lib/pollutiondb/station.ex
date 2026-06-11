defmodule Pollutiondb.Station do
  use Ecto.Schema
  require Ecto.Query

  schema "stations" do
      field :name, :string
      field :lon, :float
      field :lat, :float
  end


  def add_station(station)
      Repo.insert(station)
  end

  def get_all() 
    Repo.all(Pollutiondb.Station)
  end

  def get_by_id(id)
    Repo.get(Pollutiondb.Station, id)
  end

  def remove(station)
    Repo.delete(station)
  end

  def find_by_name(name)
    Repo.all(Ecto.Query.where(Pollutiondb.Station, name: ^name))
  end

  def find_by_location(lon, lat)
      Ecto.Query.from(s in Pollutiondb.Station, 
      where: s.lon == ^lon,
      where: s.lat == ^lat)
      |> Repo.all
  end

  def find_by_location_range(lon_min, lon_max, lat_min, lat_max)
      Ecto.Query.from(s in Pollutiondb.Station,
        where: s.lon == ^lon,
      )
  end

  def update_name(station, newnamm)
    Ecto.Changeset.cast(station, %{name: newname}, [:name])
    |> Ecto.Changeset.validate_required([:name])
    |> Pollutiondb.Repo.update


  end
end
