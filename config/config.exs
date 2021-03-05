# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :events_app,
  ecto_repos: [EventsApp.Repo]

# Configures the endpoint
config :events_app, EventsAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4p0m0m9KNkkBAkV6pVZXibJbRCVoQY3CxW45EWm2QgwB+5iI26I26zeOvDECNDan",
  render_errors: [view: EventsAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: EventsApp.PubSub,
  live_view: [signing_salt: "h9+jwJaB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
