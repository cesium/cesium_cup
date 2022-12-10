defmodule CesiumCup.Tournament.Game do
  @moduledoc """
  A game from a tournament
  """
  use CesiumCup.Schema

  alias CesiumCup.Teams.Team
  alias CesiumCup.Tourmanent.Group

  @required_fields ~w(date first_half second_half stage state)a

  @optional_fields ~w(home_team_id away_team_id group_id)

  schema "games" do
    field :date, :naive_datetime
    field :first_half, :date
    field :second_half, :date
    field :stage, :string
    field :state, :string

    belongs_to :home_team, Team
    belongs_to :away_team, Team

    belongs_to :group, Group

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
