defmodule RumblWeb.SessionController do
  use RumblWeb, :controller

  def new(conn, _) do
    render(conn, "new.html", session: conn.params[:session])
  end

  def create(conn, %{"username" => username, "password" => password}) do
    case Rumbl.Accounts.authenticate_by_username_and_pass(username, password) do
      {:ok, user} ->
        conn
        |> RumblWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back, #{user.name}!")
        |> redirect(to: ~p"/users")

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> RumblWeb.Auth.logout()
    |> redirect(to: ~p"/sessions/new")
  end
end
