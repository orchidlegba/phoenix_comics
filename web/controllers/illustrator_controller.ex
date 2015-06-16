defmodule Comics.IllustratorController do
  use Comics.Web, :controller

  alias Comics.Illustrator

  plug :scrub_params, "illustrator" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    illustrators = Repo.all(Illustrator)
    render(conn, "index.json", illustrators: illustrators)
  end

  def create(conn, %{"illustrator" => illustrator_params}) do
    changeset = Illustrator.changeset(%Illustrator{}, illustrator_params)

    if changeset.valid? do
      illustrator = Repo.insert(changeset)
      render(conn, "show.json", illustrator: illustrator)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Comics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    illustrator = Repo.get(Illustrator, id)
    render conn, "show.json", illustrator: illustrator
  end

  def update(conn, %{"id" => id, "illustrator" => illustrator_params}) do
    illustrator = Repo.get(Illustrator, id)
    changeset = Illustrator.changeset(illustrator, illustrator_params)

    if changeset.valid? do
      illustrator = Repo.update(changeset)
      render(conn, "show.json", illustrator: illustrator)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Comics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    illustrator = Repo.get(Illustrator, id)

    illustrator = Repo.delete(illustrator)
    render(conn, "show.json", illustrator: illustrator)
  end
end
