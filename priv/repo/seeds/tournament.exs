defmodule CesiumCup.Repo.Seeds.Tournament do
  alias CesiumCup.Repo

  alias CesiumCup.Tournament.EliminationRound
  alias CesiumCup.Tournament.Group

  def run do
    seed_groups()
    seed_elimination_rounds()
  end

  def seed_groups do
    case Repo.all(Group) do
      [] ->
        [
          %{
            name: "A"
          },
          %{
            name: "B"
          },
          %{
            name: "C"
          },
          %{
            name: "D"
          }
        ]
        |> Enum.each(&insert_group/1)

      _ ->
        Mix.shell().error("Found groups, aborting seeding groups.")
    end
  end

  def insert_group(data) do
    %Group{}
    |> Group.changeset(data)
    |> Repo.insert!()
  end

  def seed_elimination_rounds do
    case Repo.all(EliminationRound) do
      [] ->
        [
          %{
            name: "Quarter-Finals"
          },
          %{
            name: "Semi-Finals"
          },
          %{
            name: "Final"
          }
        ]
        |> Enum.each(&insert_elimination_round/1)

      _ ->
        Mix.shell().error("Found elimination rounds, aborting seeding elimination rounds.")
    end
  end

  def insert_elimination_round(data) do
    %EliminationRound{}
    |> EliminationRound.changeset(data)
    |> Repo.insert!()
  end
end

CesiumCup.Repo.Seeds.Tournament.run()
