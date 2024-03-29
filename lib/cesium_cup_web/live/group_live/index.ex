defmodule CesiumCupWeb.GroupLive.Index do
  @moduledoc false
  use CesiumCupWeb, :live_view

  alias CesiumCup.Tournament
  alias CesiumCup.Tournament.Group

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :groups, list_groups())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Group")
    |> assign(:group, Tournament.get_group!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Group")
    |> assign(:group, %Group{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Groups")
    |> assign(:group, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    group = Tournament.get_group!(id)
    {:ok, _} = Tournament.delete_group(group)

    {:noreply, assign(socket, :groups, list_groups())}
  end

  defp list_groups do
    Tournament.list_groups()
  end
end
