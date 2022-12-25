defmodule CesiumCupWeb.MatchLive.FormComponent do
  @moduledoc false
  use CesiumCupWeb, :live_component

  alias CesiumCup.Teams
  alias CesiumCup.Tournament
  alias CesiumCup.Tournament.Event

  @impl true
  def update(%{match: match} = assigns, socket) do
    changeset = Tournament.change_match(match)

    teams = Teams.list_teams()
    groups = Tournament.list_groups()
    elimination_rounds = Tournament.list_elimination_rounds()
    home_team_players = get_team_players(match.home_team_id)
    away_team_players = get_team_players(match.away_team_id)
    players = Enum.concat(home_team_players, away_team_players)
    types = ~w(goal assist injury foul yellow_card red_card sub_in sub_out)a

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:teams, teams)
     |> assign(:groups, groups)
     |> assign(:elimination_rounds, elimination_rounds)
     |> assign(:players, players)
     |> assign(:types, types)
     |> assign(:changeset, changeset)}
  end

  defp get_team_players(team_id) do
    if not is_nil(team_id) do
      Teams.list_players(where: [team_id: team_id])
    else
      []
    end
  end

  @impl true
  def handle_event("validate", %{"match" => match_params}, socket) do
    changeset =
      socket.assigns.match
      |> Tournament.change_match(match_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("add-event", _, socket) do
    existing_events =
      Map.get(
        socket.assigns.changeset.changes,
        :events,
        socket.assigns.match.events
      )

    events =
      existing_events
      |> Enum.concat([Tournament.change_event(%Event{})])

    changeset =
      socket.assigns.changeset
      |> Ecto.Changeset.put_assoc(:events, events)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("rm-event", %{"index" => index}, socket) do
    new_events =
      Map.get(
        socket.assigns.match.events,
        :events
      )
      |> List.delete_at(String.to_integer(index))

    changeset =
      socket.assigns.changeset
      |> Ecto.Changeset.put_assoc(:events, new_events)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"match" => match_params}, socket) do
    save_match(socket, socket.assigns.action, match_params)
  end

  defp save_match(socket, :edit, match_params) do
    case Tournament.update_match(socket.assigns.match, match_params) do
      {:ok, _match} ->
        {:noreply,
         socket
         |> put_flash(:info, "Match updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_match(socket, :new, match_params) do
    case Tournament.create_match(match_params) do
      {:ok, _match} ->
        {:noreply,
         socket
         |> put_flash(:info, "Match created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
