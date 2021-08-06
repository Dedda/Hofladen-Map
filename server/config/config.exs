# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hofladen,
  ecto_repos: [Hofladen.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :hofladen, HofladenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lYhPPPxZiAO8FRbq6fnfGcVlrLO6+cuUP/xMoSsl5S6i6PS1Hl3c66cj/vkuZitR",
  render_errors: [view: HofladenWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hofladen.PubSub,
  live_view: [signing_salt: "CM8Cj33j"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :mnesia,
  dir: "config_#{Mix.env()}.mnesia"