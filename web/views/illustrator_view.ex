defmodule Comics.IllustratorView do
  use Comics.Web, :view

  def render("index.json", %{illustrators: illustrators}) do
    %{data: render_many(illustrators, "illustrator.json")}
  end

  def render("show.json", %{illustrator: illustrator}) do
    %{data: render_one(illustrator, "illustrator.json")}
  end

  def render("illustrator.json", %{illustrator: illustrator}) do
    %{id: illustrator.id}
  end
end
