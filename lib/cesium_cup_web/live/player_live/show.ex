defmodule CesiumCupWeb.PlayerLive.Show do
  @moduledoc false
  use CesiumCupWeb, :live_view

  alias CesiumCup.Teams

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:player, Teams.get_player!(id, preloads: [:team]))}
  end

  defp page_title(:show), do: "Show Player"
  defp page_title(:edit), do: "Edit Player"
end
