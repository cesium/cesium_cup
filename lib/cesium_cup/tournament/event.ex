defmodule CesiumCup.Tournament.Event do
  @moduledoc """
  A match event
  """
  use CesiumCup.Schema
  alias CesiumCup.Teams.Player
  alias CesiumCup.Tournament.Match

  @required_fields ~w(type half player_id match_id)a
  @optional_fields ~w(delete)a

  @types ~w(start goal assist injury foul yellow_card red_card sub_in sub_out)a

  schema "events" do
    field :type, Ecto.Enum, values: @types

    field :half, Ecto.Enum, values: [:first_half, :second_half]

    belongs_to :match, Match
    belongs_to :player, Player

    field :delete, :boolean, virtual: true

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> maybe_mark_for_deletion()
  end

  defp maybe_mark_for_deletion(%{data: %{id: nil}} = changeset), do: changeset

  defp maybe_mark_for_deletion(changeset) do
    if get_change(changeset, :delete) do
      %{changeset | action: :delete}
    else
      changeset
    end
  end
end
