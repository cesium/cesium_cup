defmodule CesiumCupWeb.PlayerLive.Show do
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
    player = Teams.get_player!(id, preloads: [:team, :events])
    matches = list_matches(player.team.id)
    {:noreply,
    socket
    |> assign(:page_title, page_title(socket.assigns.live_action))
    |> assign(:player, player)
    |> assign(:matches, matches)}
  end

  defp list_matches(id) do
    Tournament.list_matches(
      where: [home_team_id: id],
      preloads: [:home_team, :away_team, :events]
    )
    |> Enum.concat(
      Tournament.list_matches(
        where: [away_team_id: id],
        preloads: [:home_team, :away_team, :events]
      )
    )
  end

  defp get_team(id) do
    Teams.get_team!(id)
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

  defp page_title(:show), do: "Show Player"
  defp page_title(:edit), do: "Edit Player"
end
