defmodule ChatterWeb.Router do
  use ChatterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatterWeb do
    pipe_through :browser # Use the default browser stack

    get "/chatone", PageController, :chatone
    get "/chattwo", PageController, :chattwo
    get "/", PageController, :index
    get "/about", PageController, :about
    get "/contact", PageController, :contact
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatterWeb do
  #   pipe_through :api
  # end
end
