defmodule CesiumCupWeb.EventLiveTest do
  use CesiumCupWeb.ConnCase

  import Phoenix.LiveViewTest
  import CesiumCup.TournamentFixtures

  @create_attrs %{type: "some type"}
  @update_attrs %{type: "some updated type"}
  @invalid_attrs %{type: nil}

  defp create_event(_) do
    event = event_fixture()
    %{event: event}
  end

  describe "Index" do
    setup [:create_event]

    test "deletes event in listing", %{conn: conn, event: event} do
      {:ok, index_live, _html} = live(conn, Routes.event_index_path(conn, :index))

      assert index_live |> element("#event-#{event.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#event-#{event.id}")
    end
  end
end
