defmodule HelloWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :hello

  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :hello
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug HelloWeb.Router
end
