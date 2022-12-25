defmodule CesiumCup.TournamentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CesiumCup.Tournament` context.
  """
  import CesiumCup.TeamsFixtures

  @doc """
  Generate a game.
  """
  def match_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        date: %{day: 11, hour: 11, minute: 19, month: 7, year: 2022},
        state: "upcoming",
        group_id: group_fixture().id,
        elimination_round_id: elimination_round_fixture().id,
        away_team_id: team_fixture().id,
        home_team_id: team_fixture().id
      })
      |> CesiumCup.Tournament.create_match()

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
        type: "yellow_card",
        player_id: player_fixture().id,
        match_id: match_fixture().id,
        state: "halftime"
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
