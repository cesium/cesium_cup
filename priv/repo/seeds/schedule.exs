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
            date: ~N[2023-11-20 16:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Portugal"),
            away_team_id: get_team_id("Argentina"),
            group_id: get_group_id("A"),
            group_round: 1
          },
          %{
            date: ~N[2023-11-20 16:00:00],
            state: :upcoming,
            home_team_id: get_team_id("France"),
            away_team_id: get_team_id("Brazil"),
            group_id: get_group_id("A"),
            group_round: 1
          },
          %{
            date: ~N[2023-11-24 13:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Portugal"),
            away_team_id: get_team_id("Brazil"),
            group_id: get_group_id("A"),
            group_round: 2
          },
          %{
            date: ~N[2023-11-24 13:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Argentina"),
            away_team_id: get_team_id("France"),
            group_id: get_group_id("A"),
            group_round: 2
          },
          %{
            date: ~N[2023-11-28 17:00:00],
            state: :upcoming,
            home_team_id: get_team_id("France"),
            away_team_id: get_team_id("Portugal"),
            group_id: get_group_id("A"),
            group_round: 3
          },
          %{
            date: ~N[2023-11-28 18:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Brazil"),
            away_team_id: get_team_id("Argentina"),
            group_id: get_group_id("A"),
            group_round: 3
          },
          %{
            date: ~N[2023-11-21 18:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Germany"),
            away_team_id: get_team_id("Spain"),
            group_id: get_group_id("B"),
            group_round: 1
          },
          %{
            date: ~N[2023-11-21 21:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Japan"),
            away_team_id: get_team_id("Uruguay"),
            group_id: get_group_id("B"),
            group_round: 1
          },
          %{
            date: ~N[2023-11-25 21:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Germany"),
            away_team_id: get_team_id("Japan"),
            group_id: get_group_id("B"),
            group_round: 2
          },
          %{
            date: ~N[2023-11-25 20:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Uruguay"),
            away_team_id: get_team_id("Spain"),
            group_id: get_group_id("B"),
            group_round: 2
          },
          %{
            date: ~N[2023-11-29 20:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Spain"),
            away_team_id: get_team_id("Japan"),
            group_id: get_group_id("B"),
            group_round: 3
          },
          %{
            date: ~N[2023-11-29 19:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Germany"),
            away_team_id: get_team_id("Uruguay"),
            group_id: get_group_id("B"),
            group_round: 3
          },
          %{
            date: ~N[2023-11-22 19:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Netherlands"),
            away_team_id: get_team_id("Italy"),
            group_id: get_group_id("C"),
            group_round: 1
          },
          %{
            date: ~N[2023-11-22 18:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Morocco"),
            away_team_id: get_team_id("South Korea"),
            group_id: get_group_id("C"),
            group_round: 1
          },
          %{
            date: ~N[2023-11-26 18:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Italy"),
            away_team_id: get_team_id("Morocco"),
            group_id: get_group_id("C"),
            group_round: 2
          },
          %{
            date: ~N[2023-11-26 17:00:00],
            state: :upcoming,
            home_team_id: get_team_id("South Korea"),
            away_team_id: get_team_id("Netherlands"),
            group_id: get_group_id("C"),
            group_round: 2
          },
          %{
            date: ~N[2023-11-30 17:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Italy"),
            away_team_id: get_team_id("South Korea"),
            group_id: get_group_id("C"),
            group_round: 3
          },
          %{
            date: ~N[2023-11-30 14:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Netherlands"),
            away_team_id: get_team_id("Morocco"),
            group_id: get_group_id("C"),
            group_round: 3
          },
          %{
            date: ~N[2023-11-23 14:00:00],
            state: :upcoming,
            home_team_id: get_team_id("England"),
            away_team_id: get_team_id("Belgium"),
            group_id: get_group_id("D"),
            group_round: 1
          },
          %{
            date: ~N[2023-11-23 14:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Croatia"),
            away_team_id: get_team_id("USA"),
            group_id: get_group_id("D"),
            group_round: 1
          },
          %{
            date: ~N[2023-11-27 16:00:00],
            state: :upcoming,
            home_team_id: get_team_id("USA"),
            away_team_id: get_team_id("England"),
            group_id: get_group_id("D"),
            group_round: 2
          },
          %{
            date: ~N[2023-11-27 16:00:00],
            state: :upcoming,
            home_team_id: get_team_id("Belgium"),
            away_team_id: get_team_id("Croatia"),
            group_id: get_group_id("D"),
            group_round: 2
          },
          %{
            date: ~N[2023-12-01 16:00:00],
            state: :upcoming,
            home_team_id: get_team_id("England"),
            away_team_id: get_team_id("Croatia"),
            group_id: get_group_id("D"),
            group_round: 3
          },
          %{
            date: ~N[2023-12-01 16:00:00],
            state: :upcoming,
            home_team_id: get_team_id("USA"),
            away_team_id: get_team_id("Belgium"),
            group_id: get_group_id("D"),
            group_round: 3
          },
          %{
            date: ~N[2023-12-02 15:00:00],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Quarter-Finals")
          },
          %{
            date: ~N[2023-12-03 15:00:00],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Quarter-Finals")
          },
          %{
            date: ~N[2023-12-04 15:00:00],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Quarter-Finals")
          },
          %{
            date: ~N[2023-12-05 15:00:00],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Quarter-Finals")
          },
          %{
            date: ~N[2023-12-06 16:00:00],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Semi-Finals")
          },
          %{
            date: ~N[2023-12-07 16:00:00],
            state: :upcoming,
            elimination_round_id: get_elimination_round_id("Semi-Finals")
          },
          %{
            date: ~N[2023-12-10 20:00:00],
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
