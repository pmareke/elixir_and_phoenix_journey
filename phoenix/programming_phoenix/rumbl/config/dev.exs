import Config

config :rumbl, Rumbl.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "rumbl_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :rumbl, RumblWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "srd5R4fOWXfOgZQIaALW4JkP5NL0NUqxFuxies0xv3ybJNBJxSFx0TXsF/uh92JK",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:rumbl, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:rumbl, ~w(--watch)]}
  ]

config :rumbl, RumblWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/rumbl_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :rumbl, dev_routes: true

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  debug_heex_annotations: true,
  enable_expensive_runtime_checks: true

config :swoosh, :api_client, false
