# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :demo,
  ecto_repos: [Demo.Repo]

# Configures the endpoint
config :demo, DemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NUvAclizd7Ug56NFNqM670fECfsJAOZDd45pzADxREhSLxmN/0QiD6uAKe7N4aqk",
  render_errors: [view: DemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Demo.PubSub,
  live_view: [signing_salt: "O2gT1a7T"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
