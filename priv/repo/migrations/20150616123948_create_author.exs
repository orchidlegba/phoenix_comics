defmodule Comics.Repo.Migrations.CreateAuthor do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :firstname, :string
      add :lastname, :string
      add :comic_fk, :integer

      timestamps
    end

  end
end
