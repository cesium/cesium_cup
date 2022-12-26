defmodule CesiumCup.Repo.Seeds.Tournament do
  alias CesiumCup.Repo

  alias CesiumCup.Teams.Player
  alias CesiumCup.Teams.Team
  alias CesiumCup.Tournament.Group

  @courses File.read!("priv/fake/uminho_courses.txt") |> String.split("\n")

  def run do
    seed_teams()
    seed_players()
  end

  def get_group_id(name) do
    Repo.get_by(Group, name: name).id
  end

  def seed_teams do
    case Repo.all(Team) do
      [] ->
        [
          %{
            name: "Portugal",
            group_id: get_group_id("A")
          },
          %{
            name: "Argentina",
            group_id: get_group_id("A")
          },
          %{
            name: "France",
            group_id: get_group_id("A")
          },
          %{
            name: "Brazil",
            group_id: get_group_id("A")
          },
          %{
            name: "Germany",
            group_id: get_group_id("B")
          },
          %{
            name: "Spain",
            group_id: get_group_id("B")
          },
          %{
            name: "Japan",
            group_id: get_group_id("B")
          },
          %{
            name: "Uruguai",
            group_id: get_group_id("B")
          },
          %{
            name: "Netherlands",
            group_id: get_group_id("C")
          },
          %{
            name: "Italy",
            group_id: get_group_id("C")
          },
          %{
            name: "Morroco",
            group_id: get_group_id("C")
          },
          %{
            name: "South Korea",
            group_id: get_group_id("C")
          },
          %{
            name: "England",
            group_id: get_group_id("D")
          },
          %{
            name: "Croatia",
            group_id: get_group_id("D")
          },
          %{
            name: "USA",
            group_id: get_group_id("D")
          },
          %{
            name: "Belgium",
            group_id: get_group_id("D")
          }
        ]
        |> Enum.each(&insert_team/1)

      _ ->
        Mix.shell().error("Found teams, aborting seeding teams.")
    end
  end

  def insert_team(data) do
    %Team{}
    |> Team.changeset(data)
    |> Repo.insert!()
  end

  def get_team_id(name) do
    Repo.get_by(Team, name: name).id
  end

  def seed_players do
    case Repo.all(Player) do
      [] ->
        [
          %{
            name: "Diogo Costa",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Rui Patrício",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Pepe",
            position: :fixed,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Ruben Dias",
            position: :fixed,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "João Cancelo",
            position: :fixed,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Bernardo Silva",
            position: :wing,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Bruno Fernandes",
            position: :wing,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Renato Sanches",
            position: :wing,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Rafael Leão",
            position: :wing,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Diogo Jota",
            position: :target,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "João Felix",
            position: :target,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Crisitiano Ronaldo",
            position: :target,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Portugal"),
            date_of_birth: ~D[2000-01-01],
            capitain: true
          },
          %{
            name: "Emiliano Martinez",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Gerónimo Rulli ",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Otamendi",
            position: :fixed,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Lisandro Martínez",
            position: :fixed,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Marcos Acuña",
            position: :fixed,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Enzo Fernandez",
            position: :wing,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Di Maria",
            position: :wing,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Paulo Dibala",
            position: :wing,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Alexis Mac Allister",
            position: :wing,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "De Paul",
            position: :wing,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Lautaro Martinez",
            position: :target,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: false
          },
          %{
            name: "Lionel Messi",
            position: :target,
            course: Enum.random(@courses),
            height: 177,
            weight: 75,
            team_id: get_team_id("Argentina"),
            date_of_birth: ~D[2000-01-01],
            capitain: true
          }
        ]
        |> Enum.each(&insert_player/1)

      _ ->
        Mix.shell().error("Found players, aborting seeding players.")
    end
  end

  def insert_player(data) do
    %Player{}
    |> Player.changeset(data)
    |> Repo.insert!()
  end
end

CesiumCup.Repo.Seeds.Tournament.run()
