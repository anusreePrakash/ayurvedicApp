# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sreeShasta,
  ecto_repos: [SreeShasta.Repo]

# Configures the endpoint
config :sreeShasta, SreeShasta.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8cfL8Nk0zYo0lGCg7rKdpToJ6PIqTx1xacFW3hjVpHH1SQBDEto0fihB02ZnHPuH",
  render_errors: [view: SreeShasta.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SreeShasta.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :twilex,
  sid: "YOUR_TWILIO_SID",
  token: "YOUR_TWILIO_AUTH_TOKEN"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
