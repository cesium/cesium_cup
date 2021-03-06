defmodule CesiumCup.TournamentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CesiumCup.Tournament` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        date: ~N[2022-07-11 11:19:00],
        first_half: ~D[2022-07-11],
        second_half: ~D[2022-07-11],
        stage: "some stage",
        state: "some state"
      })
      |> CesiumCup.Tournament.create_game()

    game
  end
end
