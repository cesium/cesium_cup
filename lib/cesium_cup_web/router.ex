defmodule CesiumCupWeb.Router do
  use CesiumCupWeb, :router

  import CesiumCupWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {CesiumCupWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CesiumCupWeb do
    pipe_through :browser
  end

  # Other scopes may use custom stacks.
  # scope "/api", CesiumCupWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CesiumCupWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", CesiumCupWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", CesiumCupWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  end

  scope "/", CesiumCupWeb do
    pipe_through [:browser]

    live "/", HomeLive.Index, :index

    live "/matches", MatchLive.Index, :index
    live "/matches/new", MatchLive.Index, :new
    live "/matches/:id/edit", MatchLive.Index, :edit

    live "/matches/:id", MatchLive.Show, :show
    live "/matches/:id/show/edit", MatchLive.Show, :edit

    live "/teams", TeamLive.Index, :index
    live "/teams/new", TeamLive.Index, :new
    live "/teams/:id/edit", TeamLive.Index, :edit

    live "/teams/:id", TeamLive.Show, :show
    live "/teams/:id/show/edit", TeamLive.Show, :edit

    live "/events", EventLive.Index, :index
    live "/events/new", EventLive.Index, :new
    live "/events/:id/edit", EventLive.Index, :edit

    live "/events/:id", EventLive.Show, :show
    live "/events/:id/show/edit", EventLive.Show, :edit

    live "/players", PlayerLive.Index, :index
    live "/players/new", PlayerLive.Index, :new
    live "/players/:id/edit", PlayerLive.Index, :edit

    live "/players/:id", PlayerLive.Show, :show
    live "/players/:id/show/edit", PlayerLive.Show, :edit

    live "/groups", GroupLive.Index, :index
    live "/groups/new", GroupLive.Index, :new
    live "/groups/:id/edit", GroupLive.Index, :edit

    live "/groups/:id", GroupLive.Show, :show
    live "/groups/:id/show/edit", GroupLive.Show, :edit

    live "/rounds", EliminationRoundLive.Index, :index
    live "/rounds/new", EliminationRoundLive.Index, :new
    live "/rounds/:id/edit", EliminationRoundLive.Index, :edit

    live "/rounds/:id", EliminationRoundLive.Show, :show
    live "/rounds/:id/show/edit", EliminationRoundLive.Show, :edit

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update
  end
end
