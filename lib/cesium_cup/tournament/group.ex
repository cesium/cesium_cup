defmodule CesiumCup.Tournament.Group do
  @moduledoc """
  A group from a tournament
  """
  use CesiumCup.Schema

  alias CesiumCup.Teams.Team
  alias CesiumCup.Tournament.Game

  @required_fields ~w(name)a

  @optional_fields []

  schema "groups" do
    field :name, :string

    has_many :teams, Team
    has_many :games, Game

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
