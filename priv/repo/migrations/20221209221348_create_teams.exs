defmodule CesiumCup.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :name, :string
      add :establishment, :date

      add :group_id, references(:groups, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
  end
end
