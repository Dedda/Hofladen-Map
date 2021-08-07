defmodule Hofladen.Timetables do

  import Ecto.Query, warn: false
  alias Hofladen.Repo

  alias Hofladen.Timetables.OpeningHours

  def list_opening_hours do
    Repo.all(OpeningHours)
  end

  def get_opening_hours!(id), do: Repo.get!(OpeningHours, id)

  def opening_hours_for_shop(shop_id), do: Repo.all(from oh in OpeningHours, where: oh.shop == ^shop_id)

  def create_opening_hours(attrs \\ %{}) do
    %OpeningHours{}
    |> OpeningHours.changeset(attrs)
    |> Repo.insert()
  end

  def update_opening_hours(%OpeningHours{} = opening_hours, attrs) do
    opening_hours
    |> OpeningHours.changeset(attrs)
    |> Repo.update()
  end

  def delete_opening_hours(%OpeningHours{} = opening_hours) do
    Repo.delete(opening_hours)
  end

  def change_opening_hours(%OpeningHours{} = opening_hours, attrs \\ %{}) do
    OpeningHours.changeset(opening_hours, attrs)
  end

  alias Hofladen.Timetables.OpeningHoursHolidays

  def list_opening_hours_holidays do
    Repo.all(OpeningHoursHolidays)
  end

  def get_opening_hours_holidays!(id), do: Repo.get!(OpeningHoursHolidays, id)

  def opening_hours_holidays_for_shop(shop_id), do: Repo.all(from oh in OpeningHoursHolidays, where: oh.shop == ^shop_id)

  def create_opening_hours_holidays(attrs \\ %{}) do
    %OpeningHoursHolidays{}
    |> OpeningHoursHolidays.changeset(attrs)
    |> Repo.insert()
  end

  def update_opening_hours_holidays(%OpeningHoursHolidays{} = opening_hours_holidays, attrs) do
    opening_hours_holidays
    |> OpeningHoursHolidays.changeset(attrs)
    |> Repo.update()
  end

  def delete_opening_hours_holidays(%OpeningHoursHolidays{} = opening_hours_holidays) do
    Repo.delete(opening_hours_holidays)
  end

  def change_opening_hours_holidays(%OpeningHoursHolidays{} = opening_hours_holidays, attrs \\ %{}) do
    OpeningHoursHolidays.changeset(opening_hours_holidays, attrs)
  end
end
