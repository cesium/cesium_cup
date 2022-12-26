defmodule CesiumCup.Repo.Seeds.Schedule do
  alias CesiumCup.Repo

  alias CesiumCup.Teams.Team
  alias CesiumCup.Tournament.EliminationRound
  alias CesiumCup.Tournament.Group
  alias CesiumCup.Tournament.Match

  def run do
    seed_matches()
  end

  def get_team_id(name) do
    Repo.get_by(Team, name: name).id
  end

  def get_group_id(name) do
    Repo.get_by(Group, name: name).id
  end

  def get_elimination_round_id(name) do
    Repo.get_by(EliminationRound, name: name).id
  end

  def seed_matches do
    case Repo.all(Match) do
      [] ->
        [
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Portugal"),
            away_team_id: get_team_id("Argentina"),
            group_id: get_group_id("A")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("France"),
            away_team_id: get_team_id("Brazil"),
            group_id: get_group_id("A")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Portugal"),
            away_team_id: get_team_id("Brazil"),
            group_id: get_group_id("A")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Argentina"),
            away_team_id: get_team_id("France"),
            group_id: get_group_id("A")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("France"),
            away_team_id: get_team_id("Portugal"),
            group_id: get_group_id("A")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Brazil"),
            away_team_id: get_team_id("Argentina"),
            group_id: get_group_id("A")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Germany"),
            away_team_id: get_team_id("Spain"),
            group_id: get_group_id("B")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Japan"),
            away_team_id: get_team_id("Uruguai"),
            group_id: get_group_id("B")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Germany"),
            away_team_id: get_team_id("Japan"),
            group_id: get_group_id("B")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Uruguai"),
            away_team_id: get_team_id("Spain"),
            group_id: get_group_id("B")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Spain"),
            away_team_id: get_team_id("Japan"),
            group_id: get_group_id("B")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Germany"),
            away_team_id: get_team_id("Uruguai"),
            group_id: get_group_id("B")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Netherlands"),
            away_team_id: get_team_id("Italy"),
            group_id: get_group_id("C")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Morroco"),
            away_team_id: get_team_id("South Korea"),
            group_id: get_group_id("C")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Italy"),
            away_team_id: get_team_id("Morroco"),
            group_id: get_group_id("C")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("South Korea"),
            away_team_id: get_team_id("Netherlands"),
            group_id: get_group_id("C")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Italy"),
            away_team_id: get_team_id("South Korea"),
            group_id: get_group_id("C")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Netherlands"),
            away_team_id: get_team_id("Morroco"),
            group_id: get_group_id("C")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("England"),
            away_team_id: get_team_id("Belgium"),
            group_id: get_group_id("D")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Croatia"),
            away_team_id: get_team_id("USA"),
            group_id: get_group_id("D")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("USA"),
            away_team_id: get_team_id("England"),
            group_id: get_group_id("D")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("Belgium"),
            away_team_id: get_team_id("Croatia"),
            group_id: get_group_id("D")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("England"),
            away_team_id: get_team_id("Croatia"),
            group_id: get_group_id("D")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            home_team_id: get_team_id("USA"),
            away_team_id: get_team_id("Belgium"),
            group_id: get_group_id("D")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Quarter-Finals")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Quarter-Finals")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Quarter-Finals")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Quarter-Finals")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Semi-Finals")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Semi-Finals")
          },
          %{
            date: ~N[2019-03-31 01:59:59.123],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Final")
          }
        ]
        |> Enum.each(&insert_match/1)

      _ ->
        Mix.shell().error("Found matches, aborting seeding matches.")
    end
  end

  def insert_match(data) do
    %Match{}
    |> Match.changeset(data)
    |> Repo.insert!()
  end
end

CesiumCup.Repo.Seeds.Schedule.run()
