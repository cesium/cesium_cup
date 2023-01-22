defmodule CesiumCupWeb.MatchLive.Show do
  @moduledoc false
  use CesiumCupWeb, :live_view

  alias CesiumCup.Teams
  alias CesiumCup.Tournament

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Tournament.subscribe("update_match")
      Tournament.subscribe("update_match_state")
    end

    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    match =
      Tournament.get_match!(id,
        preloads: [:home_team, :away_team, :events]
      )

    home_team_game_players = Teams.list_players_in_game!(id, match.home_team_id)
    home_team_bench_players = Teams.list_players_in_bench!(id, match.home_team_id)
    away_team_game_players = Teams.list_players_in_game!(id, match.away_team_id)
    away_team_bench_players = Teams.list_players_in_bench!(id, match.away_team_id)

    first_half_events = Tournament.list_events(where: [match_id: match.id, half: :first_half])
    second_half_events = Tournament.list_events(where: [match_id: match.id, half: :second_half])

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:focused_player, nil)
     |> assign(
       :event_types,
       ~w(goal assist injury foul yellow_card red_card start sub_in sub_out)a
     )
     |> assign(:first_half_events, first_half_events)
     |> assign(:second_half_events, second_half_events)
     |> assign(:home_team_first_half_score, Tournament.get_home_team_first_half_score(id))
     |> assign(:away_team_first_half_score, Tournament.get_away_team_first_half_score(id))
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

  def get_group(group_id) do
    Tournament.get_group!(group_id)
  end

  def get_elimination_round(elimination_round_id) do
    Tournament.get_elimination_round!(elimination_round_id)
  end

  @impl true
  def handle_event("focus-player", %{"player_id" => player_id}, socket) do
    {:noreply,
     socket
     |> assign(:focused_player, Teams.get_player!(player_id))}
  end

  @impl true
  def handle_event("start-player", %{"player_id" => player_id}, socket) do
    match = socket.assigns.match

    if match.state in [:upcoming] do
      case Tournament.start_player(match.id, player_id) do
        {:ok, _} ->
          {:noreply, socket}

        {:error, _} ->
          {:noreply, socket}
      end
    end
  end

  @impl true
  def handle_event("add-event", %{"player_id" => player_id, "type" => type}, socket) do
    match = socket.assigns.match

    if match.state in [:first_half, :second_half] do
      case Tournament.add_event(match.id, player_id, String.to_atom(type), match.state) do
        {:ok, _} ->
          {:noreply, socket}

        {:error, _} ->
          {:noreply, socket}
      end
    else
      {:noreply,
       put_flash(socket, :error, "You can't add events to a match that is not in progress")}
    end
  end

  @impl true
  def handle_event("update_match_state", %{"state" => state}, socket) do
    match_id = socket.assigns.match.id
    match = Tournament.get_match!(match_id)

    if is_nil(match.home_team_id) || is_nil(match.away_team_id) do
      {:noreply, put_flash(socket, :error, "You need to select two teams to play")}
    else
      if (Tournament.is_team_live(match.home_team_id) &&
            Tournament.team_live_match_id(match.home_team_id) != match_id) ||
           (Tournament.is_team_live(match.away_team_id) &&
              Tournament.team_live_match_id(match.away_team_id) != match_id) do
        {:noreply, put_flash(socket, :error, "One of the teams is already playing")}
      else
        case Tournament.update_match_state(match_id, String.to_atom(state)) do
          {:ok, _} ->
            {:noreply, socket}

          {:error, _} ->
            {:noreply, socket}
        end
      end
    end
  end

  @impl true
  def handle_info({event, _}, socket) when event in [:update_match] do
    match =
      Tournament.get_match!(socket.assigns.match.id,
        preloads: [:home_team, :away_team, :events]
      )

    first_half_events = Tournament.list_events(where: [match_id: match.id, half: :first_half])
    second_half_events = Tournament.list_events(where: [match_id: match.id, half: :second_half])

    home_team_game_players = Teams.list_players_in_game!(match.id, match.home_team_id)
    home_team_bench_players = Teams.list_players_in_bench!(match.id, match.home_team_id)
    away_team_game_players = Teams.list_players_in_game!(match.id, match.away_team_id)
    away_team_bench_players = Teams.list_players_in_bench!(match.id, match.away_team_id)

    {:noreply,
     socket
     |> assign(:match, match)
     |> assign(:first_half_events, first_half_events)
     |> assign(:second_half_events, second_half_events)
     |> assign(:home_team_first_half_score, Tournament.get_home_team_first_half_score(match.id))
     |> assign(:away_team_first_half_score, Tournament.get_away_team_first_half_score(match.id))
     |> assign(:home_team_score, get_home_team_score(match.id))
     |> assign(:away_team_score, get_away_team_score(match.id))
     |> assign(:home_team_game_players, home_team_game_players)
     |> assign(:away_team_game_players, away_team_game_players)
     |> assign(:home_team_bench_players, home_team_bench_players)
     |> assign(:away_team_bench_players, away_team_bench_players)}
  end

  @impl true
  def handle_info({event, _}, socket) when event in [:update_match_state] do
    match =
      Tournament.get_match!(socket.assigns.match.id,
        preloads: [:home_team, :away_team, :events]
      )

    {:noreply, assign(socket, :match, match)}
  end

  defp page_title(:show), do: "Show Match"
  defp page_title(:edit), do: "Edit Match"
end
