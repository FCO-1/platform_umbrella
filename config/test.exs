import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :front, Front.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "cZyPJLHTZYXA30apjYinfWTGg3SxoOXpnnLQNdr9EoGa2vZvLMMRM8kMT9YkEkdi",
  server: false

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :back, Back.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "back_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :platform, Platform.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "platform_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :platform_web, PlatformWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "FXecUgQE4/F9EdMHZa5twKStMTdIuMzVPD4UznIteJtev3mMs15YTmfh6hWEFLBj",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :platform, Platform.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
