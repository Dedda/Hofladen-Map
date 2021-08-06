defmodule Hofladen.Repo.Migrations.CreateOpeningHoursHolidays do
  use Ecto.Migration

  def change do
    create table(:opening_hours_holidays, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :opens, :time
      add :closes, :time
      add :day, :date
      add :shop, references(:shops, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:opening_hours_holidays, [:shop])
  end
end
