defmodule Hofladen.Locations.Country do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "countries" do
    field :code, :string
    field :language, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:code, :name, :language])
    |> validate_required([:code, :name, :language])
  end
end
