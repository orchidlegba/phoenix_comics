defmodule Comics.AuthorView do
  use Comics.Web, :view

  def render("index.json", %{authors: authors}) do
    %{data: render_many(authors, "author.json")}
  end

  def render("show.json", %{author: author}) do
    %{data: render_one(author, "author.json")}
  end

  def render("author.json", %{author: author}) do
    %{id: author.id}
  end
end
