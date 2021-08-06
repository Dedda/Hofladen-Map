defmodule Hofladen.Repo do
  use Ecto.Repo,
    otp_app: :hofladen,
    adapter: Ecto.Adapters.Postgres
end
