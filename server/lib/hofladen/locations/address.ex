defmodule Hofladen.Locations.Address do
  use Ecto.Schema
  import Ecto.Changeset

  alias Hofladen.Locations.Address

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "addresses" do
    field :address, :string
    field :city, :string
    field :country, :string
    field :lat, :float
    field :lon, :float
    field :zipcode, :string
    field :shop, :binary_id

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:lat, :lon, :country, :zipcode, :city, :address, :shop])
    |> validate_required([:lat, :lon, :country, :zipcode, :city, :address, :shop])
  end

  def formatted_address(%Address{} = address) do
    country = Hofladen.Locations.country_by_code_and_language!(address.country, "EN")
    "#{address.address}, #{address.zipcode} #{address.city}, #{country.name}"
  end
end
