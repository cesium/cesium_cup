defmodule CesiumCup.Teams.Player do
  @moduledoc """
  A player.
  """
  use CesiumCup.Schema

  alias CesiumCup.Teams.Team
  alias CesiumCup.Tournament.Event

  alias CesiumCup.Uploaders

  @required_fields ~w(date_of_birth name nationality course position height weight team_id captain)a

  @optional_fields []

  @positions ~w(goalkeeper fixed wing target)a

  schema "players" do
    field :date_of_birth, :date
    field :name, :string
    field :course, :string
    field :nationality, :string
    field :height, :decimal
    field :weight, :decimal
    field :captain, :boolean, default: false

    field :position, Ecto.Enum, values: @positions

    belongs_to :team, Team

    has_many :events, Event

    field :picture, Uploaders.PlayerPicture.Type

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> cast_assoc(:events,
      required: false,
      with: &Event.changeset/2
    )
    |> cast_attachments(attrs, [:picture])
    |> validate_required(@required_fields)
  end

  def picture_changeset(user, attrs) do
    user
    |> cast_attachments(attrs, [:picture])
  end
end
