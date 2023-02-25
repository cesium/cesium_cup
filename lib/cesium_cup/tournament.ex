defmodule CesiumCup.Tournament do
  @moduledoc """
  The Tournament context.
  """
  use CesiumCup.Context
  import Ecto.Query, warn: false
  alias CesiumCup.Teams.Player
  alias CesiumCup.Teams.Team
  alias CesiumCup.Tournament.Match

  @doc """
  Returns the list of matches.

  ## Examples

      iex> list_matches()
      [%Match{}, ...]

  """
  def list_matches(opts \\ []) do
    Match
    |> apply_filters(opts)
    |> Repo.all()
  end

  @doc """
  Gets a single match.

  Raises `Ecto.NoResultsError` if the Match does not exist.

  ## Examples

      iex> get_match!(123)
      %Match{}

      iex> get_match!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match!(id, opts \\ []) do
    Match
    |> apply_filters(opts)
    |> Repo.get!(id)
  end

  @doc """
  Creates a match.

  ## Examples

      iex> create_match(%{field: value})
      {:ok, %Match{}}

      iex> create_match(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match(attrs \\ %{}) do
    %Match{}
    |> Match.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a match.

  ## Examples

      iex> update_match(match, %{field: new_value})
      {:ok, %Match{}}

      iex> update_match(match, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match(%Match{} = match, attrs) do
    match
    |> Match.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a match.

  ## Examples

      iex> delete_match(match)
      {:ok, %Match{}}

      iex> delete_match(match)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match(%Match{} = match) do
    Repo.delete(match)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match changes.

  ## Examples

      iex> change_match(match)
      %Ecto.Changeset{data: %Match{}}

  """
  def change_match(%Match{} = match, attrs \\ %{}) do
    Match.changeset(match, attrs)
  end

  alias CesiumCup.Tournament.Group

  @doc """
  Returns the list of groups.

  ## Examples

      iex> list_groups()
      [%Group{}, ...]

  """
  def list_groups(opts \\ []) when is_list(opts) do
    Group
    |> apply_filters(opts)
    |> Repo.all()
  end

  @doc """
  Gets a single group.

  Raises `Ecto.NoResultsError` if the Group does not exist.

  ## Examples

      iex> get_group!(123)
      %Group{}

      iex> get_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_group!(id), do: Repo.get!(Group, id)

  def get_group!(id, opts) when is_list(opts) do
    Group
    |> apply_filters(opts)
    |> Repo.get!(id)
  end

  @doc """
  Creates a group.

  ## Examples

      iex> create_group(%{field: value})
      {:ok, %Group{}}

      iex> create_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_group(attrs \\ %{}) do
    %Group{}
    |> Group.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a group.

  ## Examples

      iex> update_group(group, %{field: new_value})
      {:ok, %Group{}}

      iex> update_group(group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_group(%Group{} = group, attrs) do
    group
    |> Group.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a group.

  ## Examples

      iex> delete_group(group)
      {:ok, %Group{}}

      iex> delete_group(group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_group(%Group{} = group) do
    Repo.delete(group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking group changes.

  ## Examples

      iex> change_group(group)
      %Ecto.Changeset{data: %Group{}}

  """
  def change_group(%Group{} = group, attrs \\ %{}) do
    Group.changeset(group, attrs)
  end

  alias CesiumCup.Tournament.Event

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events(opts \\ []) when is_list(opts) do
    Event
    |> apply_filters(opts)
    |> Repo.all()
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id), do: Repo.get!(Event, id)

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{data: %Event{}}

  """
  def change_event(%Event{} = event, attrs \\ %{}) do
    Event.changeset(event, attrs)
  end

  alias CesiumCup.Teams.Player
  alias CesiumCup.Teams.Team

  def get_home_team_first_half_score(match_id) do
    from(e in Event,
      join: p in Player,
      on: e.player_id == p.id,
      join: m in Match,
      on: e.match_id == m.id,
      where:
        e.match_id == ^match_id and p.team_id == m.home_team_id and e.type == :goal and
          e.half == :first_half
    )
    |> Repo.aggregate(:count)
  end

  def get_away_team_first_half_score(match_id) do
    from(e in Event,
      join: p in Player,
      on: e.player_id == p.id,
      join: m in Match,
      on: e.match_id == m.id,
      where:
        e.match_id == ^match_id and p.team_id == m.away_team_id and e.type == :goal and
          e.half == :first_half
    )
    |> Repo.aggregate(:count)
  end

  def get_home_team_score(match_id) do
    from(e in Event,
      join: p in Player,
      on: e.player_id == p.id,
      join: m in Match,
      on: e.match_id == m.id,
      where: e.match_id == ^match_id and p.team_id == m.home_team_id and e.type == :goal
    )
    |> Repo.aggregate(:count)
  end

  def get_away_team_score(match_id) do
    from(e in Event,
      join: p in Player,
      on: e.player_id == p.id,
      join: m in Match,
      on: e.match_id == m.id,
      where: e.match_id == ^match_id and p.team_id == m.away_team_id and e.type == :goal
    )
    |> Repo.aggregate(:count)
  end

  def get_team_group_points(team_id) do
    group_id = Repo.get!(Team, team_id).group_id

    from(m in Match,
      where:
        (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
          m.state in [:first_half, :halftime, :second_half, :finished] and
          m.group_id == ^group_id
    )
    |> Repo.all()
    |> Enum.reduce(0, fn match, acc ->
      if team_id == match.home_team_id do
        get_home_team_points(acc, match)
      else
        get_away_team_points(acc, match)
      end
    end)
  end

  def get_home_team_points(acc, match) do
    cond do
      get_home_team_score(match.id) > get_away_team_score(match.id) -> acc + 3
      get_home_team_score(match.id) < get_away_team_score(match.id) -> acc
      true -> acc + 1
    end
  end

  def get_away_team_points(acc, match) do
    cond do
      get_home_team_score(match.id) > get_away_team_score(match.id) -> acc
      get_home_team_score(match.id) < get_away_team_score(match.id) -> acc + 3
      true -> acc + 1
    end
  end

  def direct_group_result(team_a_id, team_b_id) do
    group_id = Repo.get!(Team, team_a_id).group_id

    match =
      from(m in Match,
        where:
          ((m.home_team_id == ^team_a_id and m.away_team_id == ^team_b_id) or
             (m.home_team_id == ^team_b_id and m.away_team_id == ^team_a_id)) and
            m.group_id == ^group_id
      )
      |> Repo.one()

    if team_a_id == match.home_team_id do
      get_home_team_result(match)
    else
      get_away_team_result(match)
    end
  end

  def get_home_team_result(match) do
    cond do
      get_home_team_score(match.id) > get_away_team_score(match.id) -> :win
      get_home_team_score(match.id) < get_away_team_score(match.id) -> :loss
      true -> :tie
    end
  end

  def get_away_team_result(match) do
    cond do
      get_home_team_score(match.id) > get_away_team_score(match.id) -> :loss
      get_home_team_score(match.id) < get_away_team_score(match.id) -> :win
      true -> :tie
    end
  end

  def get_team_group_goals_for(team_id) do
    group_id = Repo.get!(Team, team_id).group_id

    from(e in Event,
      join: p in Player,
      on: e.player_id == p.id,
      join: m in Match,
      on: e.match_id == m.id,
      where: p.team_id == ^team_id and m.group_id == ^group_id and e.type == :goal
    )
    |> Repo.aggregate(:count)
  end

  def get_team_group_goals_against(team_id) do
    group_id = Repo.get!(Team, team_id).group_id

    from(e in Event,
      join: p in Player,
      on: e.player_id == p.id,
      join: m in Match,
      on: e.match_id == m.id,
      where:
        p.team_id != ^team_id and m.group_id == ^group_id and e.type == :goal and
          (m.away_team_id == ^team_id or m.home_team_id == ^team_id)
    )
    |> Repo.aggregate(:count)
  end

  def get_team_group_games_played(team_id) do
    group_id = Repo.get!(Team, team_id).group_id

    from(m in Match,
      where:
        m.group_id == ^group_id and m.state in [:first_half, :halftime, :second_half, :finished] and
          (m.away_team_id == ^team_id or m.home_team_id == ^team_id)
    )
    |> Repo.aggregate(:count)
  end

  def get_team_group_wins(team_id) do
    group_id = Repo.get!(Team, team_id).group_id

    from(m in Match,
      where:
        (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
          m.state in [:first_half, :halftime, :second_half, :finished] and
          m.group_id == ^group_id
    )
    |> Repo.all()
    |> Enum.reduce(0, fn match, acc ->
      if team_id == match.home_team_id do
        increment_home_wins(match, acc)
      else
        increment_away_wins(match, acc)
      end
    end)
  end

  defp increment_home_wins(match, acc) do
    if get_home_team_score(match.id) > get_away_team_score(match.id) do
      acc + 1
    else
      acc
    end
  end

  defp increment_away_wins(match, acc) do
    if get_home_team_score(match.id) < get_away_team_score(match.id) do
      acc + 1
    else
      acc
    end
  end

  def get_team_group_losses(team_id) do
    group_id = Repo.get!(Team, team_id).group_id

    from(m in Match,
      where:
        (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
          m.state in [:first_half, :halftime, :second_half, :finished] and
          m.group_id == ^group_id
    )
    |> Repo.all()
    |> Enum.reduce(0, fn match, acc ->
      if team_id == match.home_team_id do
        increment_home_losses(match, acc)
      else
        increment_away_losses(match, acc)
      end
    end)
  end

  defp increment_home_losses(match, acc) do
    if get_home_team_score(match.id) > get_away_team_score(match.id) do
      acc + 1
    else
      acc
    end
  end

  defp increment_away_losses(match, acc) do
    if get_home_team_score(match.id) < get_away_team_score(match.id) do
      acc + 1
    else
      acc
    end
  end

  def get_team_group_ties(team_id) do
    group_id = Repo.get!(Team, team_id).group_id

    from(m in Match,
      where:
        (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
          m.state in [:first_half, :halftime, :second_half, :finished] and
          m.group_id == ^group_id
    )
    |> Repo.all()
    |> Enum.reduce(0, fn match, acc ->
      if get_home_team_score(match.id) == get_away_team_score(match.id) do
        acc + 1
      else
        acc
      end
    end)
  end

  def get_team_live_match(team_id) do
    from(m in Match,
      where:
        (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
          m.state in [:first_half, :halftime, :second_half]
    )
    |> Repo.one()
  end

  def get_team_live_result(team_id) do
    match =
      from(m in Match,
        where:
          (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
            m.state in [:first_half, :halftime, :second_half]
      )
      |> Repo.one()

    "#{get_home_team_score(match.id)}-#{get_away_team_score(match.id)}"
  end

  def is_team_live(team_id) do
    match =
      from(m in Match,
        where:
          (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
            m.state in [:first_half, :halftime, :second_half]
      )
      |> Repo.one()

    match != nil
  end

  def is_team_live_group(team_id, group_id) do
    match =
      from(m in Match,
        where:
          (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
            m.state in [:first_half, :halftime, :second_half] and m.group_id == ^group_id
      )
      |> Repo.one()

    match != nil
  end

  def team_live_match_id(team_id) do
    match =
      from(m in Match,
        where:
          (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
            m.state in [:first_half, :halftime, :second_half]
      )
      |> Repo.one()

    match.id
  end

  def team_live_state(team_id) do
    match =
      from(m in Match,
        where:
          (m.home_team_id == ^team_id or m.away_team_id == ^team_id) and
            m.state in [:first_half, :halftime, :second_half]
      )
      |> Repo.one()

    if team_id == match.home_team_id do
      get_home_team_state(match)
    else
      get_away_team_state(match)
    end
  end

  defp get_home_team_state(match) do
    cond do
      get_home_team_score(match.id) > get_away_team_score(match.id) -> :win
      get_home_team_score(match.id) < get_away_team_score(match.id) -> :loss
      true -> :tie
    end
  end

  defp get_away_team_state(match) do
    cond do
      get_home_team_score(match.id) > get_away_team_score(match.id) -> :loss
      get_home_team_score(match.id) < get_away_team_score(match.id) -> :win
      true -> :tie
    end
  end

  def get_group_round_max do
    from(m in Match,
      select: max(m.group_round)
    )
    |> Repo.one()
  end

  def start_player(match_id, player_id) do
    %Event{}
    |> Event.changeset(%{
      match_id: match_id,
      player_id: player_id,
      type: :start,
      half: :first_half
    })
    |> Repo.insert()
    |> broadcast(:update_match)
  end

  def add_event(match_id, player_id, type, half) do
    %Event{}
    |> Event.changeset(%{
      match_id: match_id,
      player_id: player_id,
      type: type,
      half: half
    })
    |> Repo.insert()
    |> broadcast(:update_match)
  end

  def update_match_state(match_id, state) do
    match = get_match!(match_id)

    changes = %{state: state}

    Match.changeset(match, changes)
    |> Repo.update()
    |> broadcast(:update_match_state)
  end

  def list_top_players(rank, event_types) do
    from(p in Player,
      left_join:
        e in subquery(
          from e in Event,
            where: e.type in ^event_types
        ),
      on: e.player_id == p.id,
      group_by: p.id,
      order_by: [desc: :count],
      limit: ^rank,
      select: %{id: p.id, name: p.name, count: count(e.id)}
    )
    |> Repo.all()
  end

  def list_top_players_group(rank, event_types, group_id) do
    from(p in Player,
      join: t in Team,
      on: p.team_id == t.id,
      where: t.group_id == ^group_id,
      left_join:
        e in subquery(
          from e in Event,
            join: m in Match,
            on: e.match_id == m.id,
            where:
              e.type in ^event_types and
                m.group_id == ^group_id
        ),
      on: e.player_id == p.id,
      group_by: p.id,
      order_by: [desc: :count],
      limit: ^rank,
      select: %{id: p.id, name: p.name, count: count(e.id)}
    )
    |> Repo.all()
  end

  alias CesiumCup.Tournament.EliminationRound

  @doc """
  Returns the list of elimination rounds.

  ## Examples

      iex> list_elimination_rounds()
      [%EliminationRound{}, ...]

  """
  def list_elimination_rounds(opts \\ []) do
    EliminationRound
    |> apply_filters(opts)
    |> Repo.all()
  end

  @doc """
  Gets a single elimination_round.

  Raises `Ecto.NoResultsError` if the Elimination round does not exist.

  ## Examples

      iex> get_elimination_round!(123)
      %EliminationRound{}

      iex> get_elimination_round!(456)
      ** (Ecto.NoResultsError)

  """
  def get_elimination_round!(id), do: Repo.get!(EliminationRound, id)

  def get_elimination_round_by_name!(name, opts \\ []) do
    from(e in EliminationRound,
      where: e.name == ^name
    )
    |> apply_filters(opts)
    |> Repo.one()
  end

  @doc """
  Creates a elimination_round.

  ## Examples

      iex> create_elimination_round(%{field: value})
      {:ok, %EliminationRound{}}

      iex> create_elimination_round(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_elimination_round(attrs \\ %{}) do
    %EliminationRound{}
    |> EliminationRound.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a elimination_round.

  ## Examples

      iex> update_elimination_round(elimination_round, %{field: new_value})
      {:ok, %EliminationRound{}}

      iex> update_elimination_round(elimination_round, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_elimination_round(%EliminationRound{} = elimination_round, attrs) do
    elimination_round
    |> EliminationRound.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a elimination_round.

  ## Examples

      iex> delete_elimination_round(elimination_round)
      {:ok, %EliminationRound{}}

      iex> delete_elimination_round(elimination_round)
      {:error, %Ecto.Changeset{}}

  """
  def delete_elimination_round(%EliminationRound{} = elimination_round) do
    Repo.delete(elimination_round)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking elimination_round changes.

  ## Examples

      iex> change_elimination_round(elimination_round)
      %Ecto.Changeset{data: %EliminationRound{}}

  """
  def change_elimination_round(%EliminationRound{} = elimination_round, attrs \\ %{}) do
    EliminationRound.changeset(elimination_round, attrs)
  end

  def subscribe(topic) when topic in ["update_match", "update_match_state"] do
    Phoenix.PubSub.subscribe(CesiumCup.PubSub, topic)
  end

  defp broadcast({:error, _reason} = error, _event), do: error

  defp broadcast({0, nil} = error, _event), do: error

  defp broadcast({:ok, %Event{} = match_event}, event)
       when event in [:update_match] do
    Phoenix.PubSub.broadcast!(CesiumCup.PubSub, "update_match", {event, match_event})
    {:ok, match_event}
  end

  defp broadcast({:ok, match_state}, event)
       when event in [:update_match_state] do
    Phoenix.PubSub.broadcast!(CesiumCup.PubSub, "update_match_state", {event, match_state})
    {:ok, match_state}
  end
end
