defmodule Hofladen.Timetables.OpeningHours do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "opening_hours" do
    field :closes, :time
    field :day, :integer
    field :opens, :time
    field :shop, :binary_id

    timestamps()
  end

  @doc false
  def changeset(opening_hours, attrs) do
    opening_hours
    |> cast(attrs, [:opens, :closes, :day, :shop])
    |> validate_required([:opens, :closes, :day, :shop])
  end
end
