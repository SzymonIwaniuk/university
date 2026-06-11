defmodule Pollutiondb.Repo.Migrations.CreateReadings do
  use Ecto.Migration

  def change do
    create table(:readings) do
      add :datetime, :naive_datetime
      add :type, :string
      add :value, :float
      add :station_id, references(:stations, on_delete: :delete_all)
    end

    create index(:readings, [:station_id])
    create index(:readings, [:station_id, :datetime])
  end
end
