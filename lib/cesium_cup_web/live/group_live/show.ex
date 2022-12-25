defmodule CesiumCupWeb.GroupLive.Show do
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
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:group, Tournament.get_group!(id))
     |> assign(:teams, list_teams(id))
     |> assign(
       :matches,
       Tournament.list_matches(
         where: [group_id: id],
         preloads: [:home_team, :away_team, :events]
       )
     )}
  end

  defp get_team(id) do
    Teams.get_team!(id)
  end

  defp get_team_group_goals_for(team_id) do
    Tournament.get_team_group_goals_for(team_id)
  end

  defp get_team_group_goals_against(team_id) do
    Tournament.get_team_group_goals_against(team_id)
  end

  defp page_title(:show), do: "Show Group"
  defp page_title(:edit), do: "Edit Group"

  defp list_teams(group_id) do
    Teams.list_teams(where: [group_id: group_id])
  end

  defp get_home_team_score(match_id) do
    Tournament.get_home_team_score(match_id)
  end

  defp get_away_team_score(match_id) do
    Tournament.get_away_team_score(match_id)
  end
end
