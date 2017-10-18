defmodule Takso.Router do
  use Takso.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Takso.Authentication, repo: Takso.Repo    
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Takso do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/bookings", BookingController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Takso do
  #   pipe_through :api
  # end
end
