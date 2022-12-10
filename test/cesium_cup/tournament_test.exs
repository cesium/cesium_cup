defmodule CesiumCup.TournamentTest do
  use CesiumCup.DataCase

  alias CesiumCup.Tournament

  describe "games" do
    alias CesiumCup.Tournament.Game

    import CesiumCup.TournamentFixtures

    @invalid_attrs %{date: nil, first_half: nil, second_half: nil, stage: nil, state: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Tournament.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Tournament.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{
        date: ~N[2022-07-11 11:19:00],
        first_half: ~D[2022-07-11],
        second_half: ~D[2022-07-11],
        stage: "some stage",
        state: "some state"
      }

      assert {:ok, %Game{} = game} = Tournament.create_game(valid_attrs)
      assert game.date == ~N[2022-07-11 11:19:00]
      assert game.first_half == ~D[2022-07-11]
      assert game.second_half == ~D[2022-07-11]
      assert game.stage == "some stage"
      assert game.state == "some state"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tournament.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()

      update_attrs = %{
        date: ~N[2022-07-12 11:19:00],
        first_half: ~D[2022-07-12],
        second_half: ~D[2022-07-12],
        stage: "some updated stage",
        state: "some updated state"
      }

      assert {:ok, %Game{} = game} = Tournament.update_game(game, update_attrs)
      assert game.date == ~N[2022-07-12 11:19:00]
      assert game.first_half == ~D[2022-07-12]
      assert game.second_half == ~D[2022-07-12]
      assert game.stage == "some updated stage"
      assert game.state == "some updated state"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Tournament.update_game(game, @invalid_attrs)
      assert game == Tournament.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Tournament.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Tournament.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Tournament.change_game(game)
    end
  end

  describe "groups" do
    alias CesiumCup.Tournament.Group

    import CesiumCup.TournamentFixtures

    @invalid_attrs %{name: nil}

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Tournament.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Tournament.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Group{} = group} = Tournament.create_group(valid_attrs)
      assert group.name == "some name"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tournament.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Group{} = group} = Tournament.update_group(group, update_attrs)
      assert group.name == "some updated name"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Tournament.update_group(group, @invalid_attrs)
      assert group == Tournament.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Tournament.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Tournament.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Tournament.change_group(group)
    end
  end
end
