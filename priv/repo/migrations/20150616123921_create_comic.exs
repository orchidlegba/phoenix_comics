defmodule Comics.Repo.Migrations.CreateComic do
  use Ecto.Migration

  def change do
    create table(:comics) do
      add :title, :string

      timestamps
    end

  end
end
