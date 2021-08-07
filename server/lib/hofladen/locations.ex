defmodule Hofladen.Locations do

  import Ecto.Query, warn: false
  alias Hofladen.Repo

  alias Hofladen.Locations.Shop

  def list_shops do
    Repo.all(Shop)
  end

  def get_shop!(id), do: Repo.get!(Shop, id)

  def create_shop(attrs \\ %{}) do
    %Shop{}
    |> Shop.changeset(attrs)
    |> Repo.insert()
  end

  def update_shop(%Shop{} = shop, attrs) do
    shop
    |> Shop.changeset(attrs)
    |> Repo.update()
  end

  def delete_shop(%Shop{} = shop) do
    Repo.delete(shop)
  end

  def change_shop(%Shop{} = shop, attrs \\ %{}) do
    Shop.changeset(shop, attrs)
  end

  alias Hofladen.Locations.Address

  def list_addresses do
    Repo.all(Address)
  end

  def get_address!(id), do: Repo.get!(Address, id)

  def get_address_for_shop!(shop_id), do: Repo.one(from a in Address, where: a.shop == ^shop_id)

  def create_address(attrs \\ %{}) do
    %Address{}
    |> Address.changeset(attrs)
    |> Repo.insert()
  end

  def update_address(%Address{} = address, attrs) do
    address
    |> Address.changeset(attrs)
    |> Repo.update()
  end

  def delete_address(%Address{} = address) do
    Repo.delete(address)
  end

  def change_address(%Address{} = address, attrs \\ %{}) do
    Address.changeset(address, attrs)
  end

  alias Hofladen.Locations.Country

  def list_countries do
    Repo.all(Country)
  end

  def get_country!(id), do: Repo.get!(Country, id)

  def country_by_code_and_language!(code, language), do: Repo.one(from c in Country, where: c.code == ^code and c.language == ^language)

  def create_country(attrs \\ %{}) do
    %Country{}
    |> Country.changeset(attrs)
    |> Repo.insert()
  end

  def update_country(%Country{} = country, attrs) do
    country
    |> Country.changeset(attrs)
    |> Repo.update()
  end

  def delete_country(%Country{} = country) do
    Repo.delete(country)
  end

  def change_country(%Country{} = country, attrs \\ %{}) do
    Country.changeset(country, attrs)
  end
end
