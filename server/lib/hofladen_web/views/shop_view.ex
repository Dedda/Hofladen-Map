defmodule HofladenWeb.ShopView do
  use HofladenWeb, :view
  alias HofladenWeb.ShopView

  def render("index.json", %{shops: shops}) do
    render_many(shops, ShopView, "shop.json")
  end

  def render("show.json", %{shop: shop}) do
    render_one(shop, ShopView, "shop.json")
  end

  def render(
        "shop_with_address_and_times.json",
        %{
          shop: shop,
          address: address,
          country: country,
          opening_hours: opening_hours,
          opening_hours_holidays: opening_hours_holidays,
        }
      ) do
    %{
      id: shop.id,
      name: shop.name,
      address: %{
        street: address.address,
        zipcode: address.zipcode,
        city: address.city,
        country: country.name,
        lat: 0.0,
        lon: 0.0,
      },
      opening_hours: [],
      opening_hours_holidays: [],
    }
  end

  def render("shop.json", %{shop: shop}) do
    %{
      id: shop.id,
      name: shop.name
    }
  end
end
