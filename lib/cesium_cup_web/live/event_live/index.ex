defmodule CesiumCupWeb.EventLive.Index do
  @moduledoc false
  use CesiumCupWeb, :live_view

  alias CesiumCup.Tournament
  alias CesiumCup.Tournament.Event

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :events, list_events())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Event")
    |> assign(:event, Tournament.get_event!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Event")
    |> assign(:event, %Event{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Events")
    |> assign(:event, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    event = Tournament.get_event!(id)
    {:ok, _} = Tournament.delete_event(event)

    {:noreply, assign(socket, :events, list_events())}
  end

  defp list_events do
    Tournament.list_events()
  end
end
