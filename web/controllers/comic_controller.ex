defmodule Comics.ComicController do
  use Comics.Web, :controller

  alias Comics.Comic

  plug :scrub_params, "comic" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    comics = Repo.all(Comic)
    render(conn, "index.json", comics: comics)
  end

  def create(conn, %{"comic" => comic_params}) do
    changeset = Comic.changeset(%Comic{}, comic_params)

    if changeset.valid? do
      comic = Repo.insert(changeset)
      render(conn, "show.json", comic: comic)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Comics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    comic = Repo.get(Comic, id)
    render conn, "show.json", comic: comic
  end

  def update(conn, %{"id" => id, "comic" => comic_params}) do
    comic = Repo.get(Comic, id)
    changeset = Comic.changeset(comic, comic_params)

    if changeset.valid? do
      comic = Repo.update(changeset)
      render(conn, "show.json", comic: comic)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Comics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    comic = Repo.get(Comic, id)

    comic = Repo.delete(comic)
    render(conn, "show.json", comic: comic)
  end
end
