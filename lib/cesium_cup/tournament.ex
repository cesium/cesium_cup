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
      where: p.team_id != ^team_id and m.group_id == ^group_id and e.type == :goal
    )
    |> Repo.aggregate(:count)
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
    |> broadcast(:update_match)
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

  def subscribe(topic) when topic in ["update_match"] do
    Phoenix.PubSub.subscribe(CesiumCup.PubSub, topic)
  end

  defp broadcast({:error, _reason} = error, _event), do: error

  defp broadcast({0, nil} = error, _event), do: error

  defp broadcast({:ok, %Event{} = match_event}, event)
       when event in [:update_match] do
    Phoenix.PubSub.broadcast!(CesiumCup.PubSub, "update_match", {event, match_event})
    {:ok, match_event}
  end
end
