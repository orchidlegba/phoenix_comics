defmodule Comics.Router do
  use Comics.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Comics do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/comics", ComicController
    resources "/authors", AuthorController
    resources "/illustrators", IllustratorController
    resources "/currencies", CurrencyController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Comics do
  #   pipe_through :api
  # end
end
