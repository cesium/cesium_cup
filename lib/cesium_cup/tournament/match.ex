defmodule CesiumCup.Tournament.Match do
  @moduledoc """
  A tournament match
  """
  use CesiumCup.Schema

  alias CesiumCup.Teams.Team
  alias CesiumCup.Tourmanent.EliminationRound
  alias CesiumCup.Tournament.Event
  alias CesiumCup.Tourmanent.Group

  @required_fields ~w(date)a

  @optional_fields ~w(home_team_id away_team_id group_id elimination_round_id state)a

  @states ~w(upcoming first_half halftime second_half finished)a

  schema "matches" do
    field :date, :naive_datetime

    field :state, Ecto.Enum, values: @states, default: :upcoming

    belongs_to :home_team, Team
    belongs_to :away_team, Team

    belongs_to :group, Group
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
