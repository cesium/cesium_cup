defmodule CesiumCupWeb.TeamLiveTest do
  use CesiumCupWeb.ConnCase

  import Phoenix.LiveViewTest
  import CesiumCup.TeamsFixtures

  @create_attrs %{establishment: %{day: 8, month: 12, year: 2022}, name: "some name"}
  @update_attrs %{establishment: %{day: 9, month: 12, year: 2022}, name: "some updated name"}
  @invalid_attrs %{establishment: %{day: 30, month: 2, year: 2022}, name: nil}

  defp create_team(_) do
    team = team_fixture()
    %{team: team}
  end

  describe "Index" do
    setup [:create_team]

    test "lists all teams", %{conn: conn, team: team} do
      {:ok, _index_live, html} = live(conn, Routes.team_index_path(conn, :index))

      assert html =~ "Listing Teams"
      assert html =~ team.name
    end
  end

  describe "Show" do
    setup [:create_team]

    test "displays team", %{conn: conn, team: team} do
      {:ok, _show_live, html} = live(conn, Routes.team_show_path(conn, :show, team))

      assert html =~ "Show Team"
      assert html =~ team.name
    end
  end
end
