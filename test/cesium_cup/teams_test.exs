defmodule CesiumCup.TeamsTest do
  use CesiumCup.DataCase

  alias CesiumCup.Teams

  describe "teams" do
    alias CesiumCup.Teams.Team

    import CesiumCup.TeamsFixtures

    @invalid_attrs %{establishment: nil, name: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Teams.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Teams.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{establishment: ~D[2022-12-08], name: "some name"}

      assert {:ok, %Team{} = team} = Teams.create_team(valid_attrs)
      assert team.establishment == ~D[2022-12-08]
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      update_attrs = %{establishment: ~D[2022-12-09], name: "some updated name"}

      assert {:ok, %Team{} = team} = Teams.update_team(team, update_attrs)
      assert team.establishment == ~D[2022-12-09]
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_team(team, @invalid_attrs)
      assert team == Teams.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Teams.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Teams.change_team(team)
    end
  end

  describe "players" do
    alias CesiumCup.Teams.Player

    import CesiumCup.TeamsFixtures

    @invalid_attrs %{date_of_birth: nil, height: nil, name: nil, position: nil, weight: nil}

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Teams.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Teams.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{
        date_of_birth: ~D[2022-12-08],
        height: "120.5",
        name: "some name",
        position: "some position",
        weight: "120.5"
      }

      assert {:ok, %Player{} = player} = Teams.create_player(valid_attrs)
      assert player.date_of_birth == ~D[2022-12-08]
      assert player.height == Decimal.new("120.5")
      assert player.name == "some name"
      assert player.position == "some position"
      assert player.weight == Decimal.new("120.5")
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()

      update_attrs = %{
        date_of_birth: ~D[2022-12-09],
        height: "456.7",
        name: "some updated name",
        position: "some updated position",
        weight: "456.7"
      }

      assert {:ok, %Player{} = player} = Teams.update_player(player, update_attrs)
      assert player.date_of_birth == ~D[2022-12-09]
      assert player.height == Decimal.new("456.7")
      assert player.name == "some updated name"
      assert player.position == "some updated position"
      assert player.weight == Decimal.new("456.7")
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_player(player, @invalid_attrs)
      assert player == Teams.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Teams.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Teams.change_player(player)
    end
  end
end
