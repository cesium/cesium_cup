defmodule CesiumCupWeb.EliminationRoundLive.Show do
  use CesiumCupWeb, :live_view

  alias CesiumCup.Tournament

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:elimination_round, Tournament.get_elimination_round!(id))}
  end

  defp page_title(:show), do: "Show Elimination round"
  defp page_title(:edit), do: "Edit Elimination round"
end
