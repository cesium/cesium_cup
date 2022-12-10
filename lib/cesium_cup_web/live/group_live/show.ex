defmodule CesiumCupWeb.GroupLive.Show do
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
     |> assign(:group, Tournament.get_group!(id, preloads: [:teams]))}
  end

  defp page_title(:show), do: "Show Group"
  defp page_title(:edit), do: "Edit Group"
end
