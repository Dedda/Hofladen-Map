defmodule Hofladen.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :lat, :float
      add :lon, :float
      add :country, :string
      add :zipcode, :string
      add :city, :string
      add :address, :string
      add :shop, references(:shops, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:addresses, [:shop])
  end
end
