defmodule CesiumCup.Tournament.Match do
  @moduledoc """
  A tournament match
  """
  use CesiumCup.Schema

  alias CesiumCup.Teams.Team
  alias CesiumCup.Tournament.EliminationRound
  alias CesiumCup.Tournament.Event
  alias CesiumCup.Tournament.Group

  @required_fields ~w(date)a

  @optional_fields ~w(home_team_id away_team_id group_id elimination_round_index elimination_round_id state group_round)a

  @states ~w(upcoming first_half halftime second_half finished)a

  schema "matches" do
    field :date, :naive_datetime

    field :state, Ecto.Enum, values: @states, default: :upcoming

    belongs_to :home_team, Team
    belongs_to :away_team, Team

    belongs_to :group, Group

    field :group_round, :integer

    field :elimination_round_index, :integer
    belongs_to :elimination_round, EliminationRound

    has_many :events, Event

    timestamps()
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> cast_assoc(:events,
      required: false,
      with: &Event.changeset/2
    )
    |> validate_required(@required_fields)
  end
end
