defmodule CesiumCup.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :date, :naive_datetime
      add :state, :string
      add :stage, :string
      add :first_half, :date
      add :second_half, :date

      timestamps()
    end
  end
end
