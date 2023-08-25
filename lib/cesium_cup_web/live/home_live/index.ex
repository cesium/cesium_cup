defmodule CesiumCupWeb.HomeLive.Index do
  @moduledoc false
  use CesiumCupWeb, :live_view

  alias CesiumCup.Teams
  alias CesiumCup.Tournament

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply,
     socket
     |> assign(:tab, params["tab"] || "group")
     |> assign(:matches, list_matches())
     |> assign(:group_round, 1)
     |> assign(:groups, list_groups())
     |> assign(
       :selected_elimination_round,
       get_elimination_round_by_name(params["tab"] || "group")
     )
     |> assign(:elimination_rounds, list_elimination_rounds())}
  end

  defp list_matches do
    Tournament.list_matches(preloads: [:home_team, :away_team, :events])
    |> Enum.sort(
      &(Date.diff(&1.date, DateTime.utc_now()) < Date.diff(&2.date, DateTime.utc_now()))
    )
  end

  defp list_group_round_matches(group_round) do
    Tournament.list_matches(
      preloads: [:home_team, :away_team, :events],
      where: [group_round: group_round]
    )
    |> Enum.sort(&(Date.compare(&1.date, &2.date) in [:lt, :eq]))
  end

  defp list_knockout_stage_matches do
    Tournament.list_matches(preloads: [:home_team, :away_team])
    |> Enum.filter(&is_nil(&1.group_round))
  end

  defp list_groups do
    Tournament.list_groups(preloads: [:teams])
  end

  defp list_elimination_rounds do
    Tournament.list_elimination_rounds(preloads: [:matches])
  end

  defp get_elimination_round_by_name(name) do
    Tournament.get_elimination_round_by_name!(name, preloads: [:matches])
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

  defp get_team_group_points(team_id) do
    Tournament.get_team_group_points(team_id)
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

  defp get_group_round_max do
    Tournament.get_group_round_max()
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

  defp list_top_players(rank, event_types) do
    Tournament.list_top_players(rank, event_types)
  end

  def get_player(id) do
    Teams.get_player!(id)
  end

  @impl true
  def handle_event("increase_group_round", _, socket) do
    {:noreply, assign(socket, :group_round, socket.assigns.group_round + 1)}
  end

  @impl true
  def handle_event("decrease_group_round", _, socket) do
    {:noreply, assign(socket, :group_round, socket.assigns.group_round - 1)}
  end
end
