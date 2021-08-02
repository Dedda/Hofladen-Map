defmodule HofladenWeb.ShopControllerTest do
  use HofladenWeb.ConnCase

  alias Hofladen.Locations

  @shop_attrs %{
    name: "_ShopControllerTest shop",
  }

  def fixture(:shop) do
    {:ok, shop} = Locations.create_shop(@shop_attrs)
    Hofladen.Repo.insert!(%Locations.Address{
      address: "Street 1",
      zipcode: "99999",
      city: "Stadt",
      country: "DE",
      lat: 0.0,
      lon: 0.0,
      shop: shop.id,
    })
    shop
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shops", %{conn: conn} do
      conn = get(conn, Routes.shop_path(conn, :index))
      assert json_response(conn, 200) == []
    end
  end

  describe "shop/:id" do
    test "returns correct shop info", %{conn: conn} do
      shop = fixture(:shop)
      conn = get(conn, Routes.shop_path(conn, :show, shop.id))
      assert json_response(conn, 200)["name"] == shop.name
    end
  end
end
