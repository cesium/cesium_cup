defmodule CesiumCup.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :type, :string
      add :half, :string

      add :match_id, references(:matches, on_delete: :nothing, type: :binary_id)
      add :player_id, references(:players, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
  end
end
