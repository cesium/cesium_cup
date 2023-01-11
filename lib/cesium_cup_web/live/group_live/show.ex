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
     |> assign(:matches, list_matches(id))}
  end

  defp list_matches(group_id) do
    Tournament.list_matches(
      where: [group_id: group_id],
      preloads: [:home_team, :away_team, :events]
    )
    |> Enum.sort(&(Date.compare(&1.date, &2.date) in [:lt, :eq]))
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

  defp get_team_group_goals_difference(team_id) do
    get_team_group_goals_for(team_id) - get_team_group_goals_against(team_id)
  end

  defp get_team_group_games_played(team_id) do
    Tournament.get_team_group_games_played(team_id)
  end

  defp get_team_group_wins(team_id) do
    Tournament.get_team_group_wins(team_id)
  end

  defp get_team_group_losses(team_id) do
    Tournament.get_team_group_losses(team_id)
  end

  defp get_team_group_ties(team_id) do
    Tournament.get_team_group_ties(team_id)
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

  defp get_team_live_match(team_id) do
    Tournament.get_team_live_match(team_id)
  end

  defp get_team_live_result(team_id) do
    Tournament.get_team_live_result(team_id)
  end

  defp is_team_live_group(team_id, group_id) do
    Tournament.is_team_live_group(team_id, group_id)
  end

  defp team_live_state(team_id) do
    Tournament.team_live_state(team_id)
  end

  defp get_team_group_points(team_id) do
    Tournament.get_team_group_points(team_id)
  end

  defp sort_group_teams(teams) do
    teams
    |> Enum.sort(fn a, b ->
      a_points = get_team_group_points(a.id)
      b_points = get_team_group_points(b.id)

      if a_points == b_points do
        direct_result = Tournament.direct_group_result(a.id, b.id)

        if direct_result == :tie do
          a_gd = get_team_group_goals_difference(a.id)
          b_gd = get_team_group_goals_difference(b.id)

          if a_gd == b_gd do
            a_gf = get_team_group_goals_for(a.id)
            b_gf = get_team_group_goals_for(b.id)

            if a_gf == b_gf do
              true
            else
              a_gf > b_gf
            end
          else
            a_gd > b_gd
          end
        else
          direct_result == :win
        end
      else
        a_points > b_points
      end
    end)
  end
end
