defmodule Hofladen.Timetables.OpeningHoursHolidays do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "opening_hours_holidays" do
    field :closes, :time
    field :day, :date
    field :opens, :time
    field :shop, :binary_id

    timestamps()
  end

  @doc false
  def changeset(opening_hours_holidays, attrs) do
    opening_hours_holidays
    |> cast(attrs, [:opens, :closes, :day])
    |> validate_required([:opens, :closes, :day])
  end
end
