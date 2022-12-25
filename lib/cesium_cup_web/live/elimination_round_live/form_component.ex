defmodule CesiumCupWeb.EliminationRoundLive.FormComponent do
  @moduledoc false
  use CesiumCupWeb, :live_component

  alias CesiumCup.Tournament

  @impl true
  def update(%{elimination_round: elimination_round} = assigns, socket) do
    changeset = Tournament.change_elimination_round(elimination_round)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"elimination_round" => elimination_round_params}, socket) do
    changeset =
      socket.assigns.elimination_round
      |> Tournament.change_elimination_round(elimination_round_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"elimination_round" => elimination_round_params}, socket) do
    save_elimination_round(socket, socket.assigns.action, elimination_round_params)
  end

  defp save_elimination_round(socket, :edit, elimination_round_params) do
    case Tournament.update_elimination_round(
           socket.assigns.elimination_round,
           elimination_round_params
         ) do
      {:ok, _elimination_round} ->
        {:noreply,
         socket
         |> put_flash(:info, "Elimination round updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_elimination_round(socket, :new, elimination_round_params) do
    case Tournament.create_elimination_round(elimination_round_params) do
      {:ok, _elimination_round} ->
        {:noreply,
         socket
         |> put_flash(:info, "Elimination round created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
