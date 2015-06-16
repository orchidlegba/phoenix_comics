defmodule Comics.AuthorController do
  use Comics.Web, :controller

  alias Comics.Author

  plug :scrub_params, "author" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    authors = Repo.all(Author)
    render(conn, "index.json", authors: authors)
  end

  def create(conn, %{"author" => author_params}) do
    changeset = Author.changeset(%Author{}, author_params)

    if changeset.valid? do
      author = Repo.insert(changeset)
      render(conn, "show.json", author: author)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Comics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Repo.get(Author, id)
    render conn, "show.json", author: author
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Repo.get(Author, id)
    changeset = Author.changeset(author, author_params)

    if changeset.valid? do
      author = Repo.update(changeset)
      render(conn, "show.json", author: author)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Comics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Repo.get(Author, id)

    author = Repo.delete(author)
    render(conn, "show.json", author: author)
  end
end
