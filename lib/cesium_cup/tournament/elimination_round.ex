defmodule CesiumCup.Tournament.EliminationRound do
  @moduledoc """
  A elimination round from a tournament
  """
  use CesiumCup.Schema

  alias CesiumCup.Tournament.Match

  @required_fields ~w(name)a

  @optional_fields []

  schema "elimination_rounds" do
    field :name, :string

    has_many :matches, Match

    timestamps()
  end

  @doc false
  def changeset(elimination_round, attrs) do
    elimination_round
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
