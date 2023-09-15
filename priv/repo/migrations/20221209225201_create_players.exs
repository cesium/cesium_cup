defmodule CesiumCup.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :name, :string, null: false
      add :nationality, :string, null: false
      add :course, :string
      add :date_of_birth, :date
      add :position, :string
      add :height, :decimal
      add :weight, :decimal
      add :captain, :boolean

      add :team_id, references(:teams, on_delete: :nothing, type: :binary_id)

      add :picture, :string

      timestamps()
    end
  end
end
