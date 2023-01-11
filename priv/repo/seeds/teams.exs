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
            name: "Uruguay",
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
            name: "Morocco",
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
          },
          %{
            name: "Kylian Mbappé",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Antoine Griezmann",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Olivier Giroud",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "N'Golo Kanté",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Paul Pogba",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Adil Rami",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Nabil Fekir",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Blaise Matuidi",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Benjamin Pavard",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Lucas Hernandez",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Samuel Umtiti",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Presnel Kipembe",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Raphael Varane",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Steve Mandanda",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: true
          },
          %{
            name: "Hugo Lloris",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("France"),
            date_of_birth: ~D[1998-12-20],
            captain: true
          },
          %{
            name: "Allison Becker",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Ederson",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Thiago Silva",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: true
          },
          %{
            name: "Marquinhos",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Militão",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Danilo",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Alex Sandro",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Raphinha",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Lucas Paquetá",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Antony",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Casemiro",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Neymar",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Richarlison",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Vini Jr.",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Brazil"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Manuel Neuer",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: true
          },
          %{
            name: "Marc-André ter Stegen",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Antonio Rudiger",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Mats Hummels",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Niklas Sule",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Kai Havertz",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Mario Gotze",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Marco Reus",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Leroy Sané",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Joshua Kimmich",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Ilkay Gundogan",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Toni Kroos",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Leon Goretzka",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Thomas Muller",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Serge Gnabry",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Timo Werner",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Germany"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Unai Simón",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "De Gea",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Sergio Ramos",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Pique",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Aymeric Laporte",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Jordi Alba",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Dani Carvajal",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Sergio Busquets",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: true
          },
          %{
            name: "Gavi",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Pedri",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Rodri",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Dani Olmo",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Alvaro Morata",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Ansu Fati",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Nico Williams",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Spain"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "S. Gonda",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "K. Itakura",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "M. Yoshida",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "S. Taniguchi",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "J. Ito",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "A. Tanaka",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "H. Morita",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Y. Nagamoto",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: true
          },
          %{
            name: "T. Kubo",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "D. Maeda",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "D. Kamada",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Japan"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "F. Muslera",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "Diego Godin",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "J. Gimenez",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "S. Coates",
            course: Enum.random(@courses),
            position: :fixed,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "G. De Arrascaeta",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "R. Bentacur",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "F. Valverde",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "F. Pellistri",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "D. Nunez",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "E. Cavani",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: false
          },
          %{
            name: "L. Suarez",
            course: Enum.random(@courses),
            position: :target,
            height: 175,
            weight: 71,
            team_id: get_team_id("Uruguay"),
            date_of_birth: ~D[1998-12-20],
            captain: true
          },
          %{
            name: "Virgil van Dijk",
            course: Enum.random(@courses),
            position: :fixed,
            height: 193,
            weight: 92,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1991-07-08],
            captain: true
          },
          %{
            name: "Memphis Depay",
            course: Enum.random(@courses),
            position: :target,
            height: 180,
            weight: 76,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1994-02-13],
            captain: false
          },
          %{
            name: "Georginio Wijnaldum",
            course: Enum.random(@courses),
            position: :wing,
            height: 175,
            weight: 67,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1990-11-11],
            captain: false
          },
          %{
            name: "Matthijs de Ligt",
            course: Enum.random(@courses),
            position: :fixed,
            height: 190,
            weight: 82,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1997-08-12],
            captain: false
          },
          %{
            name: "Frenkie de Jong",
            course: Enum.random(@courses),
            position: :wing,
            height: 185,
            weight: 74,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1997-05-12],
            captain: false
          },
          %{
            name: "Donyell Malen",
            course: Enum.random(@courses),
            position: :target,
            height: 183,
            weight: 73,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1999-05-02],
            captain: false
          },
          %{
            name: "Steven Berghuis",
            course: Enum.random(@courses),
            position: :target,
            height: 180,
            weight: 72,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1991-11-01],
            captain: false
          },
          %{
            name: "Donny van de Beek",
            course: Enum.random(@courses),
            position: :wing,
            height: 183,
            weight: 70,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1997-04-18],
            captain: false
          },
          %{
            name: "Ryan Babel",
            course: Enum.random(@courses),
            position: :target,
            height: 182,
            weight: 75,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1986-12-19],
            captain: false
          },
          %{
            name: "Wout Weghorst",
            course: Enum.random(@courses),
            position: :target,
            height: 198,
            weight: 93,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1991-03-11],
            captain: false
          },
          %{
            name: "Luuk de Jong",
            course: Enum.random(@courses),
            position: :target,
            height: 190,
            weight: 80,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1990-08-27],
            captain: false
          },
          %{
            name: "Stefan de Vrij",
            course: Enum.random(@courses),
            position: :fixed,
            height: 190,
            weight: 75,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1992-02-05],
            captain: false
          },
          %{
            name: "Jasper Cillessen",
            course: Enum.random(@courses),
            position: :goalkeeper,
            height: 185,
            weight: 83,
            team_id: get_team_id("Netherlands"),
            date_of_birth: ~D[1989-04-22],
            captain: false
          },
          %{
            name: "Gianluigi Buffon",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 193,
            weight: 92,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1978-01-28],
            captain: true
          },
          %{
            name: "Leonardo Bonucci",
            position: :fixed,
            course: Enum.random(@courses),
            height: 190,
            weight: 82,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1987-05-01],
            captain: false
          },
          %{
            name: "Giorgio Chiellini",
            position: :fixed,
            course: Enum.random(@courses),
            height: 185,
            weight: 78,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1984-08-14],
            captain: false
          },
          %{
            name: "Jorginho",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 75,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1991-12-20],
            captain: false
          },
          %{
            name: "Nicolò Barella",
            position: :wing,
            course: Enum.random(@courses),
            height: 178,
            weight: 74,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1997-02-02],
            captain: false
          },
          %{
            name: "Lorenzo Pellegrini",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 72,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1995-06-19],
            captain: false
          },
          %{
            name: "Manuel Locatelli",
            position: :wing,
            course: Enum.random(@courses),
            height: 185,
            weight: 75,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1997-05-08],
            captain: false
          },
          %{
            name: "Domenico Berardi",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 73,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1993-08-01],
            captain: false
          },
          %{
            name: "Federico Chiesa",
            position: :target,
            course: Enum.random(@courses),
            height: 180,
            weight: 72,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1997-10-25],
            captain: false
          },
          %{
            name: "Lorenzo Insigne",
            position: :target,
            course: Enum.random(@courses),
            height: 170,
            weight: 68,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1991-06-04],
            captain: false
          },
          %{
            name: "Andrea Belotti",
            position: :target,
            course: Enum.random(@courses),
            height: 183,
            weight: 74,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1993-12-20],
            captain: false
          },
          %{
            name: "Ciro Immobile",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 72,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1990-02-20],
            captain: false
          },
          %{
            name: "Francesco Caputo",
            position: :target,
            course: Enum.random(@courses),
            height: 178,
            weight: 70,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1987-05-23],
            captain: false
          },
          %{
            name: "Simone Zaza",
            position: :target,
            course: Enum.random(@courses),
            height: 188,
            weight: 84,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1991-06-25],
            captain: false
          },
          %{
            name: "Danilo D'Ambrosio",
            position: :fixed,
            course: Enum.random(@courses),
            height: 186,
            weight: 82,
            team_id: get_team_id("Italy"),
            date_of_birth: ~D[1989-07-01],
            captain: false
          },
          %{
            name: "Yassine Bounou",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 183,
            weight: 73,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1989-05-18],
            captain: false
          },
          %{
            name: "Manuel Da Costa",
            position: :fixed,
            course: Enum.random(@courses),
            height: 183,
            weight: 82,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1987-08-01],
            captain: false
          },
          %{
            name: "Nabil Dirar",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 75,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1985-12-01],
            captain: false
          },
          %{
            name: "Hakim Ziyech",
            position: :target,
            course: Enum.random(@courses),
            height: 182,
            weight: 78,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1993-03-19],
            captain: true
          },
          %{
            name: "Ayoub El Kaabi",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 75,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1994-11-23],
            captain: false
          },
          %{
            name: "Khalid Boutaib",
            position: :target,
            course: Enum.random(@courses),
            height: 183,
            weight: 76,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1986-03-23],
            captain: false
          },
          %{
            name: "Medhi Benatia",
            position: :fixed,
            course: Enum.random(@courses),
            height: 187,
            weight: 80,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1987-04-17],
            captain: false
          },
          %{
            name: "Mehdi Carcela",
            position: :wing,
            course: Enum.random(@courses),
            height: 175,
            weight: 75,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1988-11-29],
            captain: false
          },
          %{
            name: "Younes Belhanda",
            position: :wing,
            course: Enum.random(@courses),
            height: 182,
            weight: 74,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1990-03-23],
            captain: false
          },
          %{
            name: "Zakaria Labyad",
            position: :wing,
            course: Enum.random(@courses),
            height: 181,
            weight: 76,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1992-05-09],
            captain: false
          },
          %{
            name: "Mounir Obbadi",
            position: :wing,
            course: Enum.random(@courses),
            height: 186,
            weight: 78,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1984-09-11],
            captain: false
          },
          %{
            name: "Karim El Ahmadi",
            position: :wing,
            course: Enum.random(@courses),
            height: 178,
            weight: 71,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1985-08-13],
            captain: false
          },
          %{
            name: "Noureddine Amrabat",
            position: :wing,
            course: Enum.random(@courses),
            height: 182,
            weight: 79,
            team_id: get_team_id("Morocco"),
            date_of_birth: ~D[1989-12-24],
            captain: false
          },
          %{
            name: "Kim Seung-gyu",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 188,
            weight: 82,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1989-11-24],
            captain: true
          },
          %{
            name: "Kim Min-jae",
            position: :fixed,
            course: Enum.random(@courses),
            height: 190,
            weight: 82,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1997-02-25],
            captain: false
          },
          %{
            name: "Kim Young-gwon",
            position: :fixed,
            course: Enum.random(@courses),
            height: 186,
            weight: 78,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1989-05-17],
            captain: false
          },
          %{
            name: "Park Joo-ho",
            position: :wing,
            course: Enum.random(@courses),
            height: 182,
            weight: 72,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1986-08-25],
            captain: false
          },
          %{
            name: "Koo Ja-cheol",
            position: :wing,
            course: Enum.random(@courses),
            height: 182,
            weight: 72,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1988-02-27],
            captain: false
          },
          %{
            name: "Lee Jae-sung",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 71,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1991-09-28],
            captain: false
          },
          %{
            name: "Ju Se-jong",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 74,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1992-03-24],
            captain: false
          },
          %{
            name: "Lee Chung-yong",
            position: :wing,
            course: Enum.random(@courses),
            height: 178,
            weight: 68,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1988-07-02],
            captain: false
          },
          %{
            name: "Son Heung-min",
            position: :target,
            course: Enum.random(@courses),
            height: 176,
            weight: 72,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1992-07-08],
            captain: false
          },
          %{
            name: "Hwang Hee-chan",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 72,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1996-01-08],
            captain: false
          },
          %{
            name: "Kim Shin-wook",
            position: :target,
            course: Enum.random(@courses),
            height: 191,
            weight: 83,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1988-10-04],
            captain: false
          },
          %{
            name: "Cho Hyun-woo",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 185,
            weight: 75,
            team_id: get_team_id("South Korea"),
            date_of_birth: ~D[1990-03-28],
            captain: false
          },
          %{
            name: "Jordan Pickford",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 190,
            weight: 78,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1994-03-07],
            captain: false
          },
          %{
            name: "Harry Maguire",
            position: :fixed,
            course: Enum.random(@courses),
            height: 190,
            weight: 85,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1993-03-05],
            captain: true
          },
          %{
            name: "John Stones",
            position: :fixed,
            course: Enum.random(@courses),
            height: 190,
            weight: 85,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1994-05-28],
            captain: false
          },
          %{
            name: "Trent Alexander-Arnold",
            position: :wing,
            course: Enum.random(@courses),
            height: 178,
            weight: 72,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1998-10-07],
            captain: false
          },
          %{
            name: "Ben Chilwell",
            position: :wing,
            course: Enum.random(@courses),
            height: 182,
            weight: 72,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1996-12-21],
            captain: false
          },
          %{
            name: "Jordan Henderson",
            position: :wing,
            course: Enum.random(@courses),
            height: 185,
            weight: 74,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1990-06-17],
            captain: false
          },
          %{
            name: "Mason Mount",
            position: :wing,
            course: Enum.random(@courses),
            height: 175,
            weight: 68,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1999-01-10],
            captain: false
          },
          %{
            name: "Raheem Sterling",
            position: :target,
            course: Enum.random(@courses),
            height: 175,
            weight: 68,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1994-12-08],
            captain: false
          },
          %{
            name: "Harry Kane",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 82,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1993-07-28],
            captain: false
          },
          %{
            name: "Marcus Rashford",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 76,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1997-10-31],
            captain: false
          },
          %{
            name: "Jadon Sancho",
            position: :target,
            course: Enum.random(@courses),
            height: 180,
            weight: 70,
            team_id: get_team_id("England"),
            date_of_birth: ~D[2000-03-25],
            captain: false
          },
          %{
            name: "Alex Oxlade-Chamberlain",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 76,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1993-08-15],
            captain: false
          },
          %{
            name: "Kieran Trippier",
            position: :wing,
            course: Enum.random(@courses),
            height: 178,
            weight: 72,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1990-09-19],
            captain: false
          },
          %{
            name: "Eric Dier",
            position: :wing,
            course: Enum.random(@courses),
            height: 190,
            weight: 82,
            team_id: get_team_id("England"),
            date_of_birth: ~D[1994-01-15],
            captain: false
          },
          %{
            name: "Danijel Subašić",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 195,
            weight: 84,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1984-10-27],
            captain: false
          },
          %{
            name: "Dejan Lovren",
            position: :fixed,
            course: Enum.random(@courses),
            height: 190,
            weight: 85,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1989-07-05],
            captain: false
          },
          %{
            name: "Domagoj Vida",
            position: :fixed,
            course: Enum.random(@courses),
            height: 190,
            weight: 85,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1989-04-29],
            captain: false
          },
          %{
            name: "Sime Vrsaljko",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 72,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1992-01-10],
            captain: false
          },
          %{
            name: "Ivan Strinić",
            position: :wing,
            course: Enum.random(@courses),
            height: 182,
            weight: 72,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1986-11-08],
            captain: false
          },
          %{
            name: "Luka Modrić",
            position: :wing,
            course: Enum.random(@courses),
            height: 178,
            weight: 74,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1985-09-09],
            captain: true
          },
          %{
            name: "Ivan Rakitić",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 68,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1988-03-10],
            captain: false
          },
          %{
            name: "Mateo Kovačić",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 68,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1994-05-06],
            captain: false
          },
          %{
            name: "Ivan Perišić",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 72,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1989-02-02],
            captain: false
          },
          %{
            name: "Ante Rebić",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 72,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1993-09-21],
            captain: false
          },
          %{
            name: "Marko Pjaca",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 72,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1995-05-06],
            captain: false
          },
          %{
            name: "Nikola Kalinić",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 72,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1988-01-01],
            captain: false
          },
          %{
            name: "Andréj Kramarić",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 72,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1991-06-08],
            captain: false
          },
          %{
            name: "Marcelo Brozović",
            position: :wing,
            course: Enum.random(@courses),
            height: 185,
            weight: 75,
            team_id: get_team_id("Croatia"),
            date_of_birth: ~D[1992-11-16],
            captain: false
          },
          %{
            name: "Zack Steffen",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 193,
            weight: 85,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1995-04-02],
            captain: false
          },
          %{
            name: "DeAndre Yedlin",
            position: :wing,
            course: Enum.random(@courses),
            height: 180,
            weight: 75,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1993-07-09],
            captain: false
          },
          %{
            name: "John Brooks",
            position: :fixed,
            course: Enum.random(@courses),
            height: 190,
            weight: 90,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1993-01-28],
            captain: false
          },
          %{
            name: "Tim Ream",
            position: :fixed,
            course: Enum.random(@courses),
            height: 185,
            weight: 80,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1987-03-05],
            captain: false
          },
          %{
            name: "Sergino Dest",
            position: :wing,
            course: Enum.random(@courses),
            height: 185,
            weight: 75,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[2000-11-03],
            captain: false
          },
          %{
            name: "Weston McKennie",
            position: :wing,
            course: Enum.random(@courses),
            height: 185,
            weight: 78,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1998-08-28],
            captain: false
          },
          %{
            name: "Michael Bradley",
            position: :wing,
            course: Enum.random(@courses),
            height: 185,
            weight: 75,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1987-07-31],
            captain: false
          },
          %{
            name: "Tyler Adams",
            position: :wing,
            course: Enum.random(@courses),
            height: 185,
            weight: 75,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1999-02-14],
            captain: false
          },
          %{
            name: "Christian Pulisic",
            position: :target,
            course: Enum.random(@courses),
            height: 170,
            weight: 68,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1998-09-18],
            captain: true
          },
          %{
            name: "Gio Reyna",
            position: :target,
            course: Enum.random(@courses),
            height: 170,
            weight: 68,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[2003-11-13],
            captain: false
          },
          %{
            name: "Josh Sargent",
            position: :target,
            course: Enum.random(@courses),
            height: 180,
            weight: 75,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[2000-02-20],
            captain: false
          },
          %{
            name: "Jordan Siebatcheu",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 80,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1997-04-30],
            captain: false
          },
          %{
            name: "Aron Johannsson",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 75,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1990-11-10],
            captain: false
          },
          %{
            name: "Tim Howard",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 191,
            weight: 84,
            team_id: get_team_id("USA"),
            date_of_birth: ~D[1979-03-06],
            captain: false
          },
          %{
            name: "Thibaut Courtois",
            position: :goalkeeper,
            course: Enum.random(@courses),
            height: 199,
            weight: 92,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1992-05-11],
            captain: true
          },
          %{
            name: "Toby Alderweireld",
            position: :fixed,
            course: Enum.random(@courses),
            height: 185,
            weight: 82,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1989-03-02],
            captain: false
          },
          %{
            name: "Jan Vertonghen",
            position: :fixed,
            course: Enum.random(@courses),
            height: 183,
            weight: 75,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1987-04-24],
            captain: false
          },
          %{
            name: "Thomas Vermaelen",
            position: :fixed,
            course: Enum.random(@courses),
            height: 180,
            weight: 75,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1985-11-14],
            captain: false
          },
          %{
            name: "Thomas Meunier",
            position: :wing,
            course: Enum.random(@courses),
            height: 185,
            weight: 75,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1991-09-12],
            captain: false
          },
          %{
            name: "Youri Tielemans",
            position: :wing,
            course: Enum.random(@courses),
            height: 181,
            weight: 70,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1997-05-07],
            captain: false
          },
          %{
            name: "Axel Witsel",
            position: :wing,
            course: Enum.random(@courses),
            height: 190,
            weight: 82,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1989-01-12],
            captain: false
          },
          %{
            name: "Leander Dendoncker",
            position: :wing,
            course: Enum.random(@courses),
            height: 186,
            weight: 75,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1995-04-15],
            captain: false
          },
          %{
            name: "Eden Hazard",
            position: :target,
            course: Enum.random(@courses),
            height: 175,
            weight: 73,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1991-01-07],
            captain: false
          },
          %{
            name: "Dries Mertens",
            position: :target,
            course: Enum.random(@courses),
            height: 170,
            weight: 68,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1987-05-06],
            captain: false
          },
          %{
            name: "Romelu Lukaku",
            position: :target,
            course: Enum.random(@courses),
            height: 190,
            weight: 85,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1993-05-13],
            captain: false
          },
          %{
            name: "Michy Batshuayi",
            position: :target,
            course: Enum.random(@courses),
            height: 185,
            weight: 79,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1993-10-02],
            captain: false
          },
          %{
            name: "Kevin De Bruyne",
            position: :wing,
            course: Enum.random(@courses),
            height: 183,
            weight: 75,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1991-06-28],
            captain: false
          },
          %{
            name: "Yannick Carrasco",
            position: :wing,
            course: Enum.random(@courses),
            height: 170,
            weight: 68,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1993-09-04],
            captain: false
          },
          %{
            name: "Dedryck Boyata",
            position: :fixed,
            course: Enum.random(@courses),
            height: 186,
            weight: 80,
            team_id: get_team_id("Belgium"),
            date_of_birth: ~D[1990-11-28],
            captain: false
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
