defmodule CesiumCupWeb.PlayerLive.FormComponent do
  @moduledoc false
  use CesiumCupWeb, :live_component

  alias CesiumCup.Teams

  @extensions_whitelist ~w(.jpg .jpeg .gif .png)
  @nationalities File.read!("priv/fake/nationalities.txt") |> String.split("\n")
  @positions ~w(goalkeeper fixed wing target)a

  @impl true
  def mount(socket) do
    {:ok,
     socket
     |> allow_upload(:picture, accept: @extensions_whitelist, max_entries: 1)}
  end

  @impl true
  def update(%{player: player} = assigns, socket) do
    changeset = Teams.change_player(player)

    teams = Teams.list_teams()

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:teams, teams)
     |> assign(:nationalities, @nationalities)
     |> assign(:positions, @positions)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"player" => player_params}, socket) do
    changeset =
      socket.assigns.player
      |> Teams.change_player(player_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"player" => player_params}, socket) do
    save_player(socket, socket.assigns.action, player_params)
  end

  defp save_player(socket, :edit, player_params) do
    case Teams.update_player(
           socket.assigns.player,
           player_params,
           &consume_picture_data(socket, &1)
         ) do
      {:ok, _player} ->
        {:noreply,
         socket
         |> put_flash(:info, "Player updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_player(socket, :new, player_params) do
    case Teams.create_player(
           player_params,
           &consume_picture_data(socket, &1)
         ) do
      {:ok, _player} ->
        {:noreply,
         socket
         |> put_flash(:info, "Player created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp consume_picture_data(socket, user) do
    consume_uploaded_entries(socket, :picture, fn %{path: path}, entry ->
      Teams.update_player_picture(user, %{
        "picture" => %Plug.Upload{
          content_type: entry.client_type,
          filename: entry.client_name,
          path: path
        }
      })
    end)
    |> case do
      [{:ok, user}] ->
        {:ok, user}

      _errors ->
        {:ok, user}
    end
  end
end
