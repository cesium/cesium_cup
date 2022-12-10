defmodule CesiumCupWeb.MatchLive.Show do
  @moduledoc false
  use CesiumCupWeb, :live_view

  alias CesiumCup.Teams
  alias CesiumCup.Tournament

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    match =
      Tournament.get_match!(id,
        preloads: [:home_team, :away_team, :events]
      )

    home_team_players = Teams.list_players(where: [team_id: match.home_team_id], preloads: [:events])
    away_team_players = Teams.list_players(where: [team_id: match.away_team_id], preloads: [:events])

    events = Tournament.list_events(where: [match_id: match.id])

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:events, events)
     |> assign(:home_team_players, home_team_players)
     |> assign(:away_team_players, away_team_players)
     |> assign(:match, match)}
  end

  defp get_player(player_id) do
    Teams.get_player!(player_id)
  end

  defp get_home_team_score(match_id) do
    Tournament.get_home_team_score(match_id)
  end

  defp get_away_team_score(match_id) do
    Tournament.get_away_team_score(match_id)
  end

  defp page_title(:show), do: "Show Match"
  defp page_title(:edit), do: "Edit Match"
end
