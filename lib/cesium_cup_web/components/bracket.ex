defmodule CesiumCupWeb.Components.Bracket do
  @moduledoc """
  The knockout stage bracket component
  """
  use Phoenix.LiveComponent

  alias CesiumCup.Tournament
  alias CesiumCupWeb.Router.Helpers, as: Routes

  def render(assigns) do
    ~H"""
    <div id={"bracket-#{@index}"}>
      <%= if @current_round > 0 do %>
        <div class="flex mr-20 items-center">
          <div class="flex-col mb-4">
            <.live_component module={CesiumCupWeb.Components.Bracket} id={"bracket-#{2 * @index + 1}"} index={2 * @index + 1} current_round={@current_round - 1} number_rounds={@number_rounds} matches={@matches} />
            <.live_component module={CesiumCupWeb.Components.Bracket} id={"bracket-#{2 * @index + 2}"} index={2 * @index + 2} current_round={@current_round - 1} number_rounds={@number_rounds} matches={@matches} />
          </div>
          <% match = Enum.find(@matches, &(&1.elimination_round_index == @index)) %>
          <%= live_redirect to: Routes.match_show_path(@socket, :show, match) do %>
            <div class="cursor-pointer bg-white border border-zinc-200 rounded-md shadow-sm hover:bg-zinc-50 my-1 relative w-40 h-28">
              <div class="h-full w-full flex-col divide-y divide-gray-200">
                <div class="w-full flex justify-between items-center h-full h-1/2 text-gray-900 px-4 py-2">
                  <p>
                    <%= if match.home_team do %>
                      <%= match.home_team.name %>
                    <% else %>
                      TBD
                    <% end %>
                  </p>

                  <p>
                    <%= if not is_nil(match.home_team_id) and match.state != :upcoming do %>
                      <%= get_home_team_score(match.id) %>
                    <% end %>
                  </p>
                </div>
                <div class="w-full flex justify-between items-center h-full h-1/2 text-gray-900 px-4 py-2">
                  <p>
                    <%= if match.away_team do %>
                      <%= match.away_team.name %>
                    <% else %>
                      TBD
                    <% end %>
                  </p>

                  <p>
                    <%= if not is_nil(match.home_team_id) and match.state != :upcoming do %>
                      <%= get_away_team_score(match.id) %>
                    <% end %>
                  </p>
                </div>
              </div>
            </div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end

  defp get_home_team_score(match_id) do
    Tournament.get_home_team_score(match_id)
  end

  defp get_away_team_score(match_id) do
    Tournament.get_away_team_score(match_id)
  end
end
