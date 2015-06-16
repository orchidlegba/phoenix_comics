defmodule Comics.ComicView do
  use Comics.Web, :view

  def render("index.json", %{comics: comics}) do
    %{data: render_many(comics, "comic.json")}
  end

  def render("show.json", %{comic: comic}) do
    %{data: render_one(comic, "comic.json")}
  end

  def render("comic.json", %{comic: comic}) do
    %{id: comic.id}
  end
end
