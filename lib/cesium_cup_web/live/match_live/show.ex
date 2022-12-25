defmodule CesiumCupWeb.MatchLive.Show do
  @moduledoc false
  use CesiumCupWeb, :live_view

  alias CesiumCup.Teams
  alias CesiumCup.Tournament

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Tournament.subscribe("update_match")
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    match =
      Tournament.get_match!(id,
        preloads: [:home_team, :away_team, :events]
      )

    home_team_game_players = Teams.list_players_in_game(id, match.home_team_id)
    home_team_bench_players = Teams.list_players_in_bench(id, match.home_team_id)
    away_team_game_players = Teams.list_players_in_game(id, match.away_team_id)
    away_team_bench_players = Teams.list_players_in_bench(id, match.away_team_id)

    events = Tournament.list_events(where: [match_id: match.id])

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:focused_player, nil)
     |> assign(:event_types, ~w(goal assist injury foul yellow_card red_card sub_in sub_out)a)
     |> assign(:events, events)
     |> assign(:home_team_score, get_home_team_score(id))
     |> assign(:away_team_score, get_away_team_score(id))
     |> assign(:home_team_game_players, home_team_game_players)
     |> assign(:away_team_game_players, away_team_game_players)
     |> assign(:home_team_bench_players, home_team_bench_players)
     |> assign(:away_team_bench_players, away_team_bench_players)
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

  @impl true
  def handle_event("focus-player", %{"player_id" => player_id}, socket) do
    {:noreply,
     socket
     |> assign(:focused_player, Teams.get_player!(player_id))}
  end

  @impl true
  def handle_event("add-event", %{"player_id" => player_id, "type" => type}, socket) do
    match_id = socket.assigns.match.id

    case Tournament.add_event(match_id, player_id, String.to_atom(type)) do
      {:ok, _} ->
        {:noreply, socket}

      {:error, _} ->
        {:noreply, socket}
    end
  end

  @impl true
  def handle_event("update_match_state", %{"state" => state}, socket) do
    match_id = socket.assigns.match.id

    case Tournament.update_match_state(match_id, String.to_atom(state)) do
      {:ok, _} ->
        {:noreply, socket}

      {:error, _} ->
        {:noreply, socket}
    end
  end

  @impl true
  def handle_info({event, _}, socket) when event in [:update_match] do
    match =
      Tournament.get_match!(socket.assigns.match.id,
        preloads: [:home_team, :away_team, :events]
      )

    events = Tournament.list_events(where: [match_id: match.id])
    home_team_game_players = Teams.list_players_in_game(match.id, match.home_team_id)
    home_team_bench_players = Teams.list_players_in_bench(match.id, match.home_team_id)
    away_team_game_players = Teams.list_players_in_game(match.id, match.away_team_id)
    away_team_bench_players = Teams.list_players_in_bench(match.id, match.away_team_id)

    {:noreply,
     socket
     |> assign(:match, match)
     |> assign(:events, events)
     |> assign(:home_team_score, get_home_team_score(match.id))
     |> assign(:away_team_score, get_away_team_score(match.id))
     |> assign(:home_team_game_players, home_team_game_players)
     |> assign(:away_team_game_players, away_team_game_players)
     |> assign(:home_team_bench_players, home_team_bench_players)
     |> assign(:away_team_bench_players, away_team_bench_players)}
  end

  defp page_title(:show), do: "Show Match"
  defp page_title(:edit), do: "Edit Match"
end
