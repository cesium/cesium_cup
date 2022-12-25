defmodule CesiumCupWeb.EliminationRoundLiveTest do
  use CesiumCupWeb.ConnCase

  import Phoenix.LiveViewTest
  import CesiumCup.TournamentFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_elimination_round(_) do
    elimination_round = elimination_round_fixture()
    %{elimination_round: elimination_round}
  end

  describe "Index" do
    setup [:create_elimination_round]

    test "lists all elimination_rounds", %{conn: conn, elimination_round: elimination_round} do
      {:ok, _index_live, html} = live(conn, Routes.elimination_round_index_path(conn, :index))

      assert html =~ "Listing Elimination Rounds"
      assert html =~ elimination_round.name
    end

    test "saves new elimination_round", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.elimination_round_index_path(conn, :index))

      assert index_live |> element("a", "New Elimination round") |> render_click() =~
               "New Elimination round"

      assert_patch(index_live, Routes.elimination_round_index_path(conn, :new))

      assert index_live
             |> form("#elimination_round-form", elimination_round: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#elimination_round-form", elimination_round: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.elimination_round_index_path(conn, :index))

      assert html =~ "Elimination round created successfully"
      assert html =~ "some name"
    end

    test "updates elimination_round in listing", %{
      conn: conn,
      elimination_round: elimination_round
    } do
      {:ok, index_live, _html} = live(conn, Routes.elimination_round_index_path(conn, :index))

      assert index_live
             |> element("#elimination_round-#{elimination_round.id} a", "Edit")
             |> render_click() =~
               "Edit Elimination Round"

      assert_patch(
        index_live,
        Routes.elimination_round_index_path(conn, :edit, elimination_round)
      )

      assert index_live
             |> form("#elimination_round-form", elimination_round: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#elimination_round-form", elimination_round: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.elimination_round_index_path(conn, :index))

      assert html =~ "Elimination round updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes elimination_round in listing", %{
      conn: conn,
      elimination_round: elimination_round
    } do
      {:ok, index_live, _html} = live(conn, Routes.elimination_round_index_path(conn, :index))

      assert index_live
             |> element("#elimination_round-#{elimination_round.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#elimination_round-#{elimination_round.id}")
    end
  end

  describe "Show" do
    setup [:create_elimination_round]

    test "displays elimination_round", %{conn: conn, elimination_round: elimination_round} do
      {:ok, _show_live, html} =
        live(conn, Routes.elimination_round_show_path(conn, :show, elimination_round))

      assert html =~ "Show Elimination round"
      assert html =~ elimination_round.name
    end

    test "updates elimination_round within modal", %{
      conn: conn,
      elimination_round: elimination_round
    } do
      {:ok, show_live, _html} =
        live(conn, Routes.elimination_round_show_path(conn, :show, elimination_round))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Elimination round"

      assert_patch(show_live, Routes.elimination_round_show_path(conn, :edit, elimination_round))

      assert show_live
             |> form("#elimination_round-form", elimination_round: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#elimination_round-form", elimination_round: @update_attrs)
        |> render_submit()
        |> follow_redirect(
          conn,
          Routes.elimination_round_show_path(conn, :show, elimination_round)
        )

      assert html =~ "Elimination round updated successfully"
      assert html =~ "some updated name"
    end
  end
end
