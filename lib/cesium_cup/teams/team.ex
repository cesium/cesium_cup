defmodule CesiumCup.Teams.Team do
  @moduledoc """
  A team.
  """
  use CesiumCup.Schema

  alias CesiumCup.Teams.Player
  alias CesiumCup.Tournament.Game
  alias CesiumCup.Tournament.Group

  @required_fields ~w(name establishment group_id)a

  @optional_fields []

  schema "teams" do
    field :establishment, :date
    field :name, :string

    has_many :players, Player
    has_many :game, Game

    belongs_to :group, Group

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
