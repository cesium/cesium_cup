defmodule CesiumCupWeb.GameLiveTest do
  use CesiumCupWeb.ConnCase

  import Phoenix.LiveViewTest
  import CesiumCup.TournamentFixtures
  import CesiumCup.TeamsFixtures

  @create_attrs %{
    date: %{day: 11, hour: 11, minute: 19, month: 7, year: 2022},
    state: "upcoming"
  }
  @update_attrs %{
    state: "first_half"
  }
  @invalid_attrs %{
    group_id: -1
  }

  defp create_match(_) do
    match = match_fixture()
    %{match: match}
  end

  describe "Index" do
    setup [:create_match]

    test "lists all matches", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.match_index_path(conn, :index))
      assert html =~ "Listing Matches"
    end
  end

  describe "Show" do
    setup [:create_match]

    test "displays match", %{conn: conn, match: match} do
      {:ok, _show_live, html} = live(conn, Routes.match_show_path(conn, :show, match))

      assert html =~ "Show Match"
    end
  end
end
