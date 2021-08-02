defmodule Hofladen.TimetablesTest do
  use Hofladen.DataCase

  alias Hofladen.Timetables

  describe "opening_hours" do
    alias Hofladen.Timetables.OpeningHours

    @valid_attrs %{closes: ~T[14:00:00], day: 42, opens: ~T[14:00:00]}
    @update_attrs %{closes: ~T[15:01:01], day: 43, opens: ~T[15:01:01]}
    @invalid_attrs %{closes: nil, day: nil, opens: nil}

    def opening_hours_fixture(attrs \\ %{}) do
      {:ok, opening_hours} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Timetables.create_opening_hours()

      opening_hours
    end

    test "list_opening_hours/0 returns all opening_hours" do
      opening_hours = opening_hours_fixture()
      assert Timetables.list_opening_hours() == [opening_hours]
    end

    test "get_opening_hours!/1 returns the opening_hours with given id" do
      opening_hours = opening_hours_fixture()
      assert Timetables.get_opening_hours!(opening_hours.id) == opening_hours
    end

    test "create_opening_hours/1 with valid data creates a opening_hours" do
      assert {:ok, %OpeningHours{} = opening_hours} = Timetables.create_opening_hours(@valid_attrs)
      assert opening_hours.closes == ~T[14:00:00]
      assert opening_hours.day == 42
      assert opening_hours.opens == ~T[14:00:00]
    end

    test "create_opening_hours/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timetables.create_opening_hours(@invalid_attrs)
    end

    test "update_opening_hours/2 with valid data updates the opening_hours" do
      opening_hours = opening_hours_fixture()
      assert {:ok, %OpeningHours{} = opening_hours} = Timetables.update_opening_hours(opening_hours, @update_attrs)
      assert opening_hours.closes == ~T[15:01:01]
      assert opening_hours.day == 43
      assert opening_hours.opens == ~T[15:01:01]
    end

    test "update_opening_hours/2 with invalid data returns error changeset" do
      opening_hours = opening_hours_fixture()
      assert {:error, %Ecto.Changeset{}} = Timetables.update_opening_hours(opening_hours, @invalid_attrs)
      assert opening_hours == Timetables.get_opening_hours!(opening_hours.id)
    end

    test "delete_opening_hours/1 deletes the opening_hours" do
      opening_hours = opening_hours_fixture()
      assert {:ok, %OpeningHours{}} = Timetables.delete_opening_hours(opening_hours)
      assert_raise Ecto.NoResultsError, fn -> Timetables.get_opening_hours!(opening_hours.id) end
    end

    test "change_opening_hours/1 returns a opening_hours changeset" do
      opening_hours = opening_hours_fixture()
      assert %Ecto.Changeset{} = Timetables.change_opening_hours(opening_hours)
    end
  end

  describe "opening_hours_holidays" do
    alias Hofladen.Timetables.OpeningHoursHolidays

    @valid_attrs %{closes: ~T[14:00:00], day: ~D[2010-04-17], opens: ~T[14:00:00]}
    @update_attrs %{closes: ~T[15:01:01], day: ~D[2011-05-18], opens: ~T[15:01:01]}
    @invalid_attrs %{closes: nil, day: nil, opens: nil}

    def opening_hours_holidays_fixture(attrs \\ %{}) do
      {:ok, opening_hours_holidays} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Timetables.create_opening_hours_holidays()

      opening_hours_holidays
    end

    test "list_opening_hours_holidays/0 returns all opening_hours_holidays" do
      opening_hours_holidays = opening_hours_holidays_fixture()
      assert Timetables.list_opening_hours_holidays() == [opening_hours_holidays]
    end

    test "get_opening_hours_holidays!/1 returns the opening_hours_holidays with given id" do
      opening_hours_holidays = opening_hours_holidays_fixture()
      assert Timetables.get_opening_hours_holidays!(opening_hours_holidays.id) == opening_hours_holidays
    end

    test "create_opening_hours_holidays/1 with valid data creates a opening_hours_holidays" do
      assert {:ok, %OpeningHoursHolidays{} = opening_hours_holidays} = Timetables.create_opening_hours_holidays(@valid_attrs)
      assert opening_hours_holidays.closes == ~T[14:00:00]
      assert opening_hours_holidays.day == ~D[2010-04-17]
      assert opening_hours_holidays.opens == ~T[14:00:00]
    end

    test "create_opening_hours_holidays/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timetables.create_opening_hours_holidays(@invalid_attrs)
    end

    test "update_opening_hours_holidays/2 with valid data updates the opening_hours_holidays" do
      opening_hours_holidays = opening_hours_holidays_fixture()
      assert {:ok, %OpeningHoursHolidays{} = opening_hours_holidays} = Timetables.update_opening_hours_holidays(opening_hours_holidays, @update_attrs)
      assert opening_hours_holidays.closes == ~T[15:01:01]
      assert opening_hours_holidays.day == ~D[2011-05-18]
      assert opening_hours_holidays.opens == ~T[15:01:01]
    end

    test "update_opening_hours_holidays/2 with invalid data returns error changeset" do
      opening_hours_holidays = opening_hours_holidays_fixture()
      assert {:error, %Ecto.Changeset{}} = Timetables.update_opening_hours_holidays(opening_hours_holidays, @invalid_attrs)
      assert opening_hours_holidays == Timetables.get_opening_hours_holidays!(opening_hours_holidays.id)
    end

    test "delete_opening_hours_holidays/1 deletes the opening_hours_holidays" do
      opening_hours_holidays = opening_hours_holidays_fixture()
      assert {:ok, %OpeningHoursHolidays{}} = Timetables.delete_opening_hours_holidays(opening_hours_holidays)
      assert_raise Ecto.NoResultsError, fn -> Timetables.get_opening_hours_holidays!(opening_hours_holidays.id) end
    end

    test "change_opening_hours_holidays/1 returns a opening_hours_holidays changeset" do
      opening_hours_holidays = opening_hours_holidays_fixture()
      assert %Ecto.Changeset{} = Timetables.change_opening_hours_holidays(opening_hours_holidays)
    end
  end
end
