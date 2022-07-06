defmodule CesiumCupWeb.PageController do
  use CesiumCupWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
