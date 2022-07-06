defmodule CesiumCup.Repo do
  use Ecto.Repo,
    otp_app: :cesium_cup,
    adapter: Ecto.Adapters.Postgres
end
