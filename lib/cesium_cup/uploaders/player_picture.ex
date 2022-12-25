defmodule CesiumCup.Uploaders.PlayerPicture do
  @moduledoc """
  PlayerImage is used for players images.
  """
  use Waffle.Definition
  use Waffle.Ecto.Definition

  alias CesiumCup.Teams.Player

  @versions [:original, :medium, :thumb]
  @extension_whitelist ~w(.jpg .jpeg .gif .png)

  def validate({file, _}) do
    file.file_name
    |> Path.extname()
    |> String.downcase()
    |> then(&Enum.member?(@extension_whitelist, &1))
    |> case do
      true -> :ok
      false -> {:error, "invalid file type"}
    end
  end

  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 100x150^ -gravity center -extent 100x150 -format png", :png}
  end

  def transform(:medium, _) do
    {:convert, "-strip -thumbnail 400x400^ -gravity center -extent 400x400 -format png", :png}
  end

  def filename(version, _) do
    version
  end

  def storage_dir(_version, {_file, %Player{} = scope}) do
    "uploads/player/#{scope.id}"
  end

  # Provide a default URL if there hasn't been a file uploaded
  def default_url(version) do
    "/images/defaults/players/player_image_#{version}.png"
  end
end
