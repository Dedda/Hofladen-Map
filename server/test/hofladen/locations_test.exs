defmodule Hofladen.LocationsTest do
  use Hofladen.DataCase

  alias Hofladen.Locations

  describe "shops" do
    alias Hofladen.Locations.Shop

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def shop_fixture(attrs \\ %{}) do
      {:ok, shop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Locations.create_shop()

      shop
    end

    test "list_shops/0 returns all shops" do
      shop = shop_fixture()
      assert Locations.list_shops()
             |>Enum.member?(shop)
    end

    test "get_shop!/1 returns the shop with given id" do
      shop = shop_fixture()
      assert Locations.get_shop!(shop.id) == shop
    end

    test "create_shop/1 with valid data creates a shop" do
      assert {:ok, %Shop{} = shop} = Locations.create_shop(@valid_attrs)
      assert shop.name == "some name"
    end

    test "create_shop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_shop(@invalid_attrs)
    end

    test "update_shop/2 with valid data updates the shop" do
      shop = shop_fixture()
      assert {:ok, %Shop{} = shop} = Locations.update_shop(shop, @update_attrs)
      assert shop.name == "some updated name"
    end

    test "update_shop/2 with invalid data returns error changeset" do
      shop = shop_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_shop(shop, @invalid_attrs)
      assert shop == Locations.get_shop!(shop.id)
    end

    test "delete_shop/1 deletes the shop" do
      shop = shop_fixture()
      assert {:ok, %Shop{}} = Locations.delete_shop(shop)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_shop!(shop.id) end
    end

    test "change_shop/1 returns a shop changeset" do
      shop = shop_fixture()
      assert %Ecto.Changeset{} = Locations.change_shop(shop)
    end
  end

  describe "addresses" do
    alias Hofladen.Locations.Address

    @valid_attrs %{address: "some address", city: "some city", country: "some country", lat: 120.5, lon: 120.5, zipcode: "some zipcode"}
    @update_attrs %{address: "some updated address", city: "some updated city", country: "some updated country", lat: 456.7, lon: 456.7, zipcode: "some updated zipcode"}
    @invalid_attrs %{address: nil, city: nil, country: nil, lat: nil, lon: nil, zipcode: nil}

    def address_fixture(attrs \\ %{}) do
      {:ok, address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Locations.create_address()

      address
    end

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert Locations.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Locations.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      assert {:ok, %Address{} = address} = Locations.create_address(@valid_attrs)
      assert address.address == "some address"
      assert address.city == "some city"
      assert address.country == "some country"
      assert address.lat == 120.5
      assert address.lon == 120.5
      assert address.zipcode == "some zipcode"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      assert {:ok, %Address{} = address} = Locations.update_address(address, @update_attrs)
      assert address.address == "some updated address"
      assert address.city == "some updated city"
      assert address.country == "some updated country"
      assert address.lat == 456.7
      assert address.lon == 456.7
      assert address.zipcode == "some updated zipcode"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_address(address, @invalid_attrs)
      assert address == Locations.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Locations.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Locations.change_address(address)
    end
  end

  describe "countries" do
    alias Hofladen.Locations.Country

    @valid_attrs %{code: "some code", language: "some language", name: "some name"}
    @update_attrs %{code: "some updated code", language: "some updated language", name: "some updated name"}
    @invalid_attrs %{code: nil, language: nil, name: nil}

    def country_fixture(attrs \\ %{}) do
      {:ok, country} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Locations.create_country()

      country
    end

    test "list_countries/0 returns all countries" do
      assert Enum.count(Locations.list_countries()) == 1
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Locations.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      assert {:ok, %Country{} = country} = Locations.create_country(@valid_attrs)
      assert country.code == "some code"
      assert country.language == "some language"
      assert country.name == "some name"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      assert {:ok, %Country{} = country} = Locations.update_country(country, @update_attrs)
      assert country.code == "some updated code"
      assert country.language == "some updated language"
      assert country.name == "some updated name"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_country(country, @invalid_attrs)
      assert country == Locations.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Locations.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Locations.change_country(country)
    end
  end
end
