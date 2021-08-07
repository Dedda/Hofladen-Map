defmodule HofladenWeb.ShopController do
  use HofladenWeb, :controller

  alias Hofladen.Locations
  alias Hofladen.Locations.Shop
  alias Hofladen.Timetables

  action_fallback HofladenWeb.FallbackController

  def index(conn, _params) do
    shops = Locations.list_shops()
    render(conn, "index.json", shops: shops)
  end

  def create(conn, %{"shop" => shop_params}) do
    with {:ok, %Shop{} = shop} <- Locations.create_shop(shop_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.shop_path(conn, :show, shop))
      |> render("show.json", shop: shop)
    end
  end

  def show(conn, %{"id" => id}) do
    shop = Locations.get_shop!(id)
    address = Locations.get_address_for_shop!(shop.id)
    country = Locations.country_by_code_and_language!(address.country, "EN")
    opening_hours = Timetables.opening_hours_for_shop(shop.id)
    opening_hours_holidays = Timetables.opening_hours_holidays_for_shop(shop.id)
    render(
      conn,
      "shop_with_address_and_times.json",
      %{
        shop: shop,
        address: address,
        country: country,
        opening_hours: opening_hours,
        opening_hours_holidays: opening_hours_holidays,
      }
    )
  end

  def update(conn, %{"id" => id, "shop" => shop_params}) do
    shop = Locations.get_shop!(id)

    with {:ok, %Shop{} = shop} <- Locations.update_shop(shop, shop_params) do
      render(conn, "show.json", shop: shop)
    end
  end

  def delete(conn, %{"id" => id}) do
    shop = Locations.get_shop!(id)

    with {:ok, %Shop{}} <- Locations.delete_shop(shop) do
      send_resp(conn, :no_content, "")
    end
  end
end
