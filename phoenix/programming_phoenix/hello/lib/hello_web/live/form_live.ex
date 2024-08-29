defmodule HelloWeb.FormLive do
  use HelloWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(form: to_form(%{email: nil, username: nil}))

    {:ok, socket}
  end

  def handle_event("change", %{"email" => email, "username" => username}, socket) do
    socket =
      socket
      |> assign(form: to_form(%{email: email, username: username}))

    {:noreply, socket}
  end
end
