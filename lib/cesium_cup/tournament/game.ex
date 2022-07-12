defmodule CesiumCup.Tournament.Game do
  @moduledoc """
  A game from a tournament
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :date, :naive_datetime
    field :first_half, :date
    field :second_half, :date
    field :stage, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:date, :state, :stage, :first_half, :second_half])
    |> validate_required([:date, :state, :stage, :first_half, :second_half])
  end
end
