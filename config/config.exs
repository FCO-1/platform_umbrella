# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :front,
  ecto_repos: [Front.Repo],
  generators: [context_app: false]

# Configures the endpoint
config :front, Front.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: Front.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Front.PubSub,
  live_view: [signing_salt: "ZiWW0Gxn"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  assets_front: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/front/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure Mix tasks and generators
config :back,
  ecto_repos: [Back.Repo]

# Configure Mix tasks and generators
config :platform,
  ecto_repos: [Platform.Repo]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :platform, Platform.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

config :platform_web,
  ecto_repos: [Platform.Repo],
  generators: [context_app: :platform]

# Configures the endpoint
config :platform_web, PlatformWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PlatformWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Platform.PubSub,
  live_view: [signing_salt: "ATgF9Ii5"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  assets_platform: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/platform_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
