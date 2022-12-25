defmodule CesiumCupWeb.EliminationRoundLive.Index do
  @moduledoc false
  use CesiumCupWeb, :live_view

  alias CesiumCup.Tournament
  alias CesiumCup.Tournament.EliminationRound

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :elimination_rounds, list_elimination_rounds())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Elimination Round")
    |> assign(:elimination_round, Tournament.get_elimination_round!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Elimination Round")
    |> assign(:elimination_round, %EliminationRound{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Elimination Rounds")
    |> assign(:elimination_round, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    elimination_round = Tournament.get_elimination_round!(id)
    {:ok, _} = Tournament.delete_elimination_round(elimination_round)

    {:noreply, assign(socket, :elimination_rounds, list_elimination_rounds())}
  end

  defp list_elimination_rounds do
    Tournament.list_elimination_rounds()
  end
end
