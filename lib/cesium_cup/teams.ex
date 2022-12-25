defmodule CesiumCup.Teams do
  @moduledoc """
  The Teams context.
  """
  use CesiumCup.Context

  import Ecto.Query, warn: false

  alias CesiumCup.Teams.Team

  @doc """
  Returns the list of teams.

  ## Examples

      iex> list_teams()
      [%Team{}, ...]

  """
  def list_teams(opts \\ []) when is_list(opts) do
    Team
    |> apply_filters(opts)
    |> Repo.all()
  end

  @doc """
  Gets a single team.

  Raises `Ecto.NoResultsError` if the Team does not exist.

  ## Examples

      iex> get_team!(123)
      %Team{}

      iex> get_team!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team!(id), do: Repo.get!(Team, id)

  def get_team!(id, opts) when is_list(opts) do
    Team
    |> apply_filters(opts)
    |> Repo.get!(id)
  end

  @doc """
  Creates a team.

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team.

  ## Examples

      iex> update_team(team, %{field: new_value})
      {:ok, %Team{}}

      iex> update_team(team, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a team.

  ## Examples

      iex> delete_team(team)
      {:ok, %Team{}}

      iex> delete_team(team)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team changes.

  ## Examples

      iex> change_team(team)
      %Ecto.Changeset{data: %Team{}}

  """
  def change_team(%Team{} = team, attrs \\ %{}) do
    Team.changeset(team, attrs)
  end

  alias CesiumCup.Teams.Player
  alias CesiumCup.Tournament.Event

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players(opts \\ []) when is_list(opts) do
    Player
    |> apply_filters(opts)
    |> Repo.all()
  end

  def list_players_in_game(match_id, team_id) do
    from(p in Player,
      where: p.team_id == ^team_id
    )
    |> Repo.all()
    |> Enum.filter(
      &(get_player_sub_in_match(&1.id, match_id) > get_player_sub_out_match(&1.id, match_id))
    )
  end

  def list_players_in_bench(match_id, team_id) do
    from(p in Player,
      where: p.team_id == ^team_id
    )
    |> Repo.all()
    |> Enum.filter(
      &(get_player_sub_in_match(&1.id, match_id) <= get_player_sub_out_match(&1.id, match_id))
    )
  end

  def get_player_sub_in_match(player_id, match_id) do
    from(e in Event,
      where: e.player_id == ^player_id and e.match_id == ^match_id and e.type == :sub_in
    )
    |> Repo.aggregate(:count)
  end

  def get_player_sub_out_match(player_id, match_id) do
    from(e in Event,
      where: e.player_id == ^player_id and e.match_id == ^match_id and e.type == :sub_out
    )
    |> Repo.aggregate(:count)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  def get_player!(id, opts) do
    Player
    |> apply_filters(opts)
    |> Repo.get!(id)
  end

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}, after_save \\ &{:ok, &1}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
    |> after_save(after_save)
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs \\ %{}, after_save \\ &{:ok, &1}) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
    |> after_save(after_save)
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end

  def update_player_picture(%Player{} = player, attrs) do
    player
    |> Player.picture_changeset(attrs)
    |> Repo.update()
  end
end
