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

require Logger

defmodule Seeds do
  def country_from_list!([code, name, language]) do
    %Hofladen.Locations.Country{
      code: code,
      name: name,
      language: language
    }
  end

  def insert_all do
    countries = [
      ["DE", "Germany", "EN"],
      ["DE", "Deutschland", "DE"],
      ["CH", "Switzerland", "EN"],
      ["CH", "Schweiz", "DE"],
      ["AT", "Austria", "EN"],
      ["AT", "Österreich", "DE"],
    ]

    IO.puts "inserting #{Enum.count(countries)} seed countries"
    countries
    |> Enum.map(&Seeds.country_from_list!/1)
    |> Enum.each(&Hofladen.Repo.insert!/1)

    IO.puts "inserting seed shops"
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
  end
end

if !Mix.env() == :test do
  Seeds.insert_all()
end