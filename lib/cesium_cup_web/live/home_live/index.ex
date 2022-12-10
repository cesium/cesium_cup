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
     |> assign(:groups, list_groups())
     |> assign(
       :selected_elimination_round,
       get_elimination_round_by_name(params["tab"] || "group")
     )
     |> assign(:elimination_rounds, list_elimination_rounds())}
  end

  defp list_matches do
    Tournament.list_matches(preloads: [:home_team, :away_team, :events])
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
end
