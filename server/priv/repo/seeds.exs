# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hofladen.Repo.insert!(%Hofladen.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
germany = Hofladen.Repo.insert!(
  %Hofladen.Locations.Country{
    code: "DE",
    name: "Germany",
    language: "EN"
  }
)
baldenwegerhof = Hofladen.Repo.insert!(
  %Hofladen.Locations.Shop{
    name: "Baldenwegerhof",
  }
)

Hofladen.Repo.insert!(
  %Hofladen.Locations.Address{
    shop: baldenwegerhof.id,
    address: "Wittentalstraße 1",
    zipcode: "79252",
    city: "Stegen",
    country: "DE",
  }
)
