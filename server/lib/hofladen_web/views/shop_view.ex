defmodule HofladenWeb.ShopView do
  use HofladenWeb, :view
  alias HofladenWeb.ShopView
  alias Hofladen.Timetables.OpeningHours
  alias Hofladen.Timetables.OpeningHoursHolidays

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
      opening_hours: opening_hours
                     |> Enum.map(&opening_hours_to_map/1),
      opening_hours_holidays: opening_hours_holidays
                              |> Enum.map(&opening_hours_holidays_to_map/1),
    }
  end

  def render("shop.json", %{shop: shop}) do
    %{
      id: shop.id,
      name: shop.name
    }
  end

  defp opening_hours_to_map(%OpeningHours{opens: opens, closes: closes, day: day}) do
    %{
      opens: "#{opens.hour}:#{opens.minute}",
      closes: "#{closes.hour}:#{closes.minute}",
      day: day,
    }
  end

  defp opening_hours_holidays_to_map(%OpeningHoursHolidays{opens: opens, closes: closes, day: day}) do
    %{
      opens: "#{opens.hour}:#{opens.minute}",
      closes: "#{closes.hour}:#{closes.minute}",
      day: "#{day.year}-#{day.month}-#{day.day}",
    }
  end
end
