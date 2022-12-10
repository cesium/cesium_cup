defmodule CesiumCup.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :date, :naive_datetime

      add :home_team_id, references(:teams, on_delete: :nothing, type: :binary_id)
      add :away_team_id, references(:teams, on_delete: :nothing, type: :binary_id)

      add :elimination_round_id,
          references(:elimination_rounds, on_delete: :nothing, type: :binary_id)

      add :group_id, references(:groups, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
  end
end
