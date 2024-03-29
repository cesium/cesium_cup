defmodule CesiumCupWeb.ViewUtils do
  @moduledoc """
  Utility functions to be used on all views.
  """
  use Timex

  alias Timex.Format.DateTime.Formatters.Relative

  def extract_initials(nil), do: ""

  def extract_initials(name) do
    initials = name |> String.upcase() |> String.split(" ") |> Enum.map(&String.slice(&1, 0, 1))

    case length(initials) do
      1 -> hd(initials)
      _ -> List.first(initials) <> List.last(initials)
    end
  end

  def extract_first_last_name(nil), do: ""

  def extract_first_last_name(name) do
    initials = name |> String.split(" ")

    case length(initials) do
      1 -> hd(initials)
      _ -> List.first(initials) <> " " <> List.last(initials)
    end
  end

  def relative_datetime(nil), do: ""

  def relative_datetime(""), do: ""

  def relative_datetime(datetime) do
    Relative.lformat!(datetime, "{relative}", Gettext.get_locale())
  end

  def display_date(nil), do: ""

  def display_date(""), do: ""

  def display_date(date) when is_binary(date) do
    date
    |> Timex.parse!("%FT%H:%M", :strftime)
    |> Timex.format!("{0D}.{0M}.{YYYY}")
  end

  def display_date(date) do
    Timex.format!(date, "{0D}.{0M}.{YYYY}")
  end

  def display_time(nil), do: ""

  def display_time(""), do: ""

  def display_time(date) when is_binary(date) do
    date
    |> Timex.parse!("%FT%H:%M", :strftime)
    |> Timex.format!("{0D}-{0M}-{YYYY}")
  end

  def display_time(date) do
    date
    |> Timex.format!("{h24}:{m}")
  end

  def get_age_string(birthday) do
    today = Date.utc_today()
    age = Timex.diff(today, birthday, :year)
    birthday_string = display_date(birthday)
    "#{age} (#{birthday_string})"
  end
end
