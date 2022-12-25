defmodule CesiumCup.TeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CesiumCup.Teams` context.
  """

  alias CesiumCup.TournamentFixtures

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        establishment: ~D[2022-12-08],
        name: "some name",
        course: "abc",
        group_id: TournamentFixtures.group_fixture().id
      })
      |> CesiumCup.Teams.create_team()

    team
  end

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        date_of_birth: ~D[2022-12-08],
        height: "120.5",
        name: "some name",
        position: "some position",
        weight: "120.5",
        course: "abc",
        team_id: team_fixture().id,
        group_id: TournamentFixtures.group_fixture().id
      })
      |> CesiumCup.Teams.create_player()

    player
  end
end
