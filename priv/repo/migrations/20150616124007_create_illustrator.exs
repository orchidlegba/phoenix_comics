defmodule Comics.Repo.Migrations.CreateIllustrator do
  use Ecto.Migration

  def change do
    create table(:illustrators) do
      add :firstname, :string
      add :lastname, :string
      add :comic_fk, :integer

      timestamps
    end

  end
end
