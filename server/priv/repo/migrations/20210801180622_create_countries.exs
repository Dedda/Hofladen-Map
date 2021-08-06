defmodule Hofladen.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :code, :string
      add :name, :string
      add :language, :string

      timestamps()
    end

    create unique_index(:countries, [:code, :language], name: :countries_code_language_unique)

  end
end
