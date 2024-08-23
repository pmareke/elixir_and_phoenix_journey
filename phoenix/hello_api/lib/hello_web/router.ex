defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HelloWeb do
    pipe_through :api

    resources "/urls", UrlController, except: [:new, :edit]
  end
end
