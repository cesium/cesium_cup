defmodule CesiumCup.Repo.Migrations.CreateEliminationRounds do
  use Ecto.Migration

  def change do
    create table(:elimination_rounds, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :name, :string

      timestamps()
    end
  end
end
