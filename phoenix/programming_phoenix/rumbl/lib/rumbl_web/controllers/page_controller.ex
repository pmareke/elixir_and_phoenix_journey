defmodule RumblWeb.PageController do
  use RumblWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def index(conn, _params) do
    render(conn, :index)
  end
end
