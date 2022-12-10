defmodule CesiumCup.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :date, :naive_datetime
      add :state, :string
      add :stage, :string
      add :first_half, :date
      add :second_half, :date

      add :home_team_id, references(:teams, on_delete: :nothing, type: :binary_id)
      add :away_team_id, references(:teams, on_delete: :nothing, type: :binary_id)

      add :group_id, references(:teams, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
  end
end
