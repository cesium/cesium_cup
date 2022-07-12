defmodule CesiumCupWeb.GameLiveTest do
  use CesiumCupWeb.ConnCase

  import Phoenix.LiveViewTest
  import CesiumCup.TournamentFixtures

  @create_attrs %{
    date: %{day: 11, hour: 11, minute: 19, month: 7, year: 2022},
    first_half: %{day: 11, month: 7, year: 2022},
    second_half: %{day: 11, month: 7, year: 2022},
    stage: "some stage",
    state: "some state"
  }
  @update_attrs %{
    date: %{day: 12, hour: 11, minute: 19, month: 7, year: 2022},
    first_half: %{day: 12, month: 7, year: 2022},
    second_half: %{day: 12, month: 7, year: 2022},
    stage: "some updated stage",
    state: "some updated state"
  }
  @invalid_attrs %{
    date: %{day: 30, hour: 11, minute: 19, month: 2, year: 2022},
    first_half: %{day: 30, month: 2, year: 2022},
    second_half: %{day: 30, month: 2, year: 2022},
    stage: nil,
    state: nil
  }

  defp create_game(_) do
    game = game_fixture()
    %{game: game}
  end

  describe "Index" do
    setup [:create_game]

    test "lists all games", %{conn: conn, game: game} do
      {:ok, _index_live, html} = live(conn, Routes.game_index_path(conn, :index))

      assert html =~ "Listing Games"
      assert html =~ game.stage
    end

    test "saves new game", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.game_index_path(conn, :index))

      assert index_live |> element("a", "New Game") |> render_click() =~
               "New Game"

      assert_patch(index_live, Routes.game_index_path(conn, :new))

      assert index_live
             |> form("#game-form", game: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#game-form", game: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.game_index_path(conn, :index))

      assert html =~ "Game created successfully"
      assert html =~ "some stage"
    end

    test "updates game in listing", %{conn: conn, game: game} do
      {:ok, index_live, _html} = live(conn, Routes.game_index_path(conn, :index))

      assert index_live |> element("#game-#{game.id} a", "Edit") |> render_click() =~
               "Edit Game"

      assert_patch(index_live, Routes.game_index_path(conn, :edit, game))

      assert index_live
             |> form("#game-form", game: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#game-form", game: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.game_index_path(conn, :index))

      assert html =~ "Game updated successfully"
      assert html =~ "some updated stage"
    end

    test "deletes game in listing", %{conn: conn, game: game} do
      {:ok, index_live, _html} = live(conn, Routes.game_index_path(conn, :index))

      assert index_live |> element("#game-#{game.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#game-#{game.id}")
    end
  end

  describe "Show" do
    setup [:create_game]

    test "displays game", %{conn: conn, game: game} do
      {:ok, _show_live, html} = live(conn, Routes.game_show_path(conn, :show, game))

      assert html =~ "Show Game"
      assert html =~ game.stage
    end

    test "updates game within modal", %{conn: conn, game: game} do
      {:ok, show_live, _html} = live(conn, Routes.game_show_path(conn, :show, game))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Game"

      assert_patch(show_live, Routes.game_show_path(conn, :edit, game))

      assert show_live
             |> form("#game-form", game: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#game-form", game: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.game_show_path(conn, :show, game))

      assert html =~ "Game updated successfully"
      assert html =~ "some updated stage"
    end
  end
end
