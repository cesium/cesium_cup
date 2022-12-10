defmodule CesiumCup.Teams.Player do
  @moduledoc """
  A player.
  """
  use CesiumCup.Schema

  alias CesiumCup.Teams.Team

  @required_fields ~w(date_of_birth name course position height weight team_id)a

  @optional_fields []

  schema "players" do
    field :date_of_birth, :date
    field :name, :string
    field :course, :string
    field :position, :string
    field :height, :decimal
    field :weight, :decimal

    belongs_to :team, Team

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
