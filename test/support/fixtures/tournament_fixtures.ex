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

  @doc """
  Generate a group.
  """
  def group_fixture(attrs \\ %{}) do
    {:ok, group} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> CesiumCup.Tournament.create_group()

    group
  end

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        type: "some type"
      })
      |> CesiumCup.Tournament.create_event()

    event
  end

  @doc """
  Generate a elimination_round.
  """
  def elimination_round_fixture(attrs \\ %{}) do
    {:ok, elimination_round} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> CesiumCup.Tournament.create_elimination_round()

    elimination_round
  end
end
