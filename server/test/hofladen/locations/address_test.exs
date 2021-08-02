defmodule Hofladen.Locations.AddressTest do
  use Hofladen.DataCase

  describe "formatting" do
    alias Hofladen.Locations.Address

    test "format/1 uses all fields" do
      address = "Wittentalstraße 1"
      zipcode = "79252"
      city = "Stegen"
      country = "DE"

      formatted = %Address{address: address, zipcode: zipcode, city: city, country: country}
                  |> Address.formatted_address()
      assert formatted == "Wittentalstraße 1, 79252 Stegen, Germany"
    end
  end

end