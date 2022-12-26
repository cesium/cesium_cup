defmodule CesiumCupWeb.MatchLive.Index do
  @moduledoc false
  use CesiumCupWeb, :live_view

  alias CesiumCup.Tournament
  alias CesiumCup.Tournament.Match

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :matches, list_matches())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Match")
    |> assign(:match, Tournament.get_match!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Match")
    |> assign(:match, %Match{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Matches")
    |> assign(:match, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    match = Tournament.get_match!(id)
    {:ok, _} = Tournament.delete_match(match)

    {:noreply, assign(socket, :matches, list_matches())}
  end

  defp list_matches do
    Tournament.list_matches(preloads: [:home_team, :away_team, :events])
    |> Enum.sort(&(Date.compare(&1.date, &2.date) in [:lt, :eq]))
  end

  defp get_group(id) do
    Tournament.get_group!(id)
  end

  defp get_elimination_round(id) do
    Tournament.get_elimination_round!(id)
  end

  defp get_home_team_score(match_id) do
    Tournament.get_home_team_score(match_id)
  end

  defp get_away_team_score(match_id) do
    Tournament.get_away_team_score(match_id)
  end
end
