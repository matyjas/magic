# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :magic, MagicWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iKN+WyCsNe5ZgdV6eKSETo2cwlh5OaMYcyLz64xyUjCELyITLm9VrXYEiZI24NmH",
  render_errors: [view: MagicWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Magic.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Pull Facebook token from environment
config :magic, :fb,
  handshake: Map.fetch!(System.get_env(), "FB_HANDSHAKE_TOKEN"),
  page: Map.fetch!(System.get_env(), "FB_PAGE_TOKEN")

# Pull Telegram token too
config :magic, :telegram,
  telegram: Map.fetch!(System.get_env(), "TELEGRAM_TOKEN")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
