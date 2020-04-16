defmodule FetchexWeb.Router do
  use FetchexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FetchexWeb do
    pipe_through :api

    get "/", IndexController, :index
    post "/", IndexController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", FetchexWeb do
  #   pipe_through :api
  # end
end
