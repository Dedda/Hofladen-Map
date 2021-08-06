defmodule Hofladen.Timetables do
  @moduledoc """
  The Timetables context.
  """

  import Ecto.Query, warn: false
  alias Hofladen.Repo

  alias Hofladen.Timetables.OpeningHours

  @doc """
  Returns the list of opening_hours.

  ## Examples

      iex> list_opening_hours()
      [%OpeningHours{}, ...]

  """
  def list_opening_hours do
    Repo.all(OpeningHours)
  end

  @doc """
  Gets a single opening_hours.

  Raises `Ecto.NoResultsError` if the Opening hours does not exist.

  ## Examples

      iex> get_opening_hours!(123)
      %OpeningHours{}

      iex> get_opening_hours!(456)
      ** (Ecto.NoResultsError)

  """
  def get_opening_hours!(id), do: Repo.get!(OpeningHours, id)

  def opening_hours_for_shop(shop_id), do: Repo.all(from oh in OpeningHours, where: oh.shop == ^shop_id)

  @doc """
  Creates a opening_hours.

  ## Examples

      iex> create_opening_hours(%{field: value})
      {:ok, %OpeningHours{}}

      iex> create_opening_hours(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_opening_hours(attrs \\ %{}) do
    %OpeningHours{}
    |> OpeningHours.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a opening_hours.

  ## Examples

      iex> update_opening_hours(opening_hours, %{field: new_value})
      {:ok, %OpeningHours{}}

      iex> update_opening_hours(opening_hours, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_opening_hours(%OpeningHours{} = opening_hours, attrs) do
    opening_hours
    |> OpeningHours.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a opening_hours.

  ## Examples

      iex> delete_opening_hours(opening_hours)
      {:ok, %OpeningHours{}}

      iex> delete_opening_hours(opening_hours)
      {:error, %Ecto.Changeset{}}

  """
  def delete_opening_hours(%OpeningHours{} = opening_hours) do
    Repo.delete(opening_hours)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking opening_hours changes.

  ## Examples

      iex> change_opening_hours(opening_hours)
      %Ecto.Changeset{data: %OpeningHours{}}

  """
  def change_opening_hours(%OpeningHours{} = opening_hours, attrs \\ %{}) do
    OpeningHours.changeset(opening_hours, attrs)
  end

  alias Hofladen.Timetables.OpeningHoursHolidays

  @doc """
  Returns the list of opening_hours_holidays.

  ## Examples

      iex> list_opening_hours_holidays()
      [%OpeningHoursHolidays{}, ...]

  """
  def list_opening_hours_holidays do
    Repo.all(OpeningHoursHolidays)
  end

  @doc """
  Gets a single opening_hours_holidays.

  Raises `Ecto.NoResultsError` if the Opening hours holidays does not exist.

  ## Examples

      iex> get_opening_hours_holidays!(123)
      %OpeningHoursHolidays{}

      iex> get_opening_hours_holidays!(456)
      ** (Ecto.NoResultsError)

  """
  def get_opening_hours_holidays!(id), do: Repo.get!(OpeningHoursHolidays, id)

  def opening_hours_holidays_for_shop(shop_id), do: Repo.all(from oh in OpeningHours, where: oh.shop == ^shop_id)

  @doc """
  Creates a opening_hours_holidays.

  ## Examples

      iex> create_opening_hours_holidays(%{field: value})
      {:ok, %OpeningHoursHolidays{}}

      iex> create_opening_hours_holidays(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_opening_hours_holidays(attrs \\ %{}) do
    %OpeningHoursHolidays{}
    |> OpeningHoursHolidays.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a opening_hours_holidays.

  ## Examples

      iex> update_opening_hours_holidays(opening_hours_holidays, %{field: new_value})
      {:ok, %OpeningHoursHolidays{}}

      iex> update_opening_hours_holidays(opening_hours_holidays, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_opening_hours_holidays(%OpeningHoursHolidays{} = opening_hours_holidays, attrs) do
    opening_hours_holidays
    |> OpeningHoursHolidays.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a opening_hours_holidays.

  ## Examples

      iex> delete_opening_hours_holidays(opening_hours_holidays)
      {:ok, %OpeningHoursHolidays{}}

      iex> delete_opening_hours_holidays(opening_hours_holidays)
      {:error, %Ecto.Changeset{}}

  """
  def delete_opening_hours_holidays(%OpeningHoursHolidays{} = opening_hours_holidays) do
    Repo.delete(opening_hours_holidays)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking opening_hours_holidays changes.

  ## Examples

      iex> change_opening_hours_holidays(opening_hours_holidays)
      %Ecto.Changeset{data: %OpeningHoursHolidays{}}

  """
  def change_opening_hours_holidays(%OpeningHoursHolidays{} = opening_hours_holidays, attrs \\ %{}) do
    OpeningHoursHolidays.changeset(opening_hours_holidays, attrs)
  end
end
