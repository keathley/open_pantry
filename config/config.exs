# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :open_pantry,
  ecto_repos: [OpenPantry.Repo]

# Configures the endpoint
config :open_pantry, OpenPantry.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EYh36bc9MEymTQNLNEVY83aY+KEngXOMsjRViOmJf33do1Lrtmwrb0x3CcIdkh1g",
  render_errors: [view: OpenPantry.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OpenPantry.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "OpenPantry",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: System.get_env("GUARDIAN_SECRET_KEY"),
  serializer: OpenPantry.GuardianSerializer

config :ex_admin,
  repo: OpenPantry.Repo,
  module: OpenPantry,
  modules: [
    OpenPantry.ExAdmin.Dashboard,
    OpenPantry.ExAdmin.Language,
    OpenPantry.ExAdmin.Facility,
    OpenPantry.ExAdmin.User,
    OpenPantry.ExAdmin.FoodGroup,
    OpenPantry.ExAdmin.Food,
    OpenPantry.ExAdmin.Stock,
    OpenPantry.ExAdmin.FoodGroupMembership,
    OpenPantry.ExAdmin.UserLanguage,
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}

