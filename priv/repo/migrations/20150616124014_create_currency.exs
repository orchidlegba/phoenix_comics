defmodule Comics.Repo.Migrations.CreateCurrency do
  use Ecto.Migration

  def change do
    create table(:currencies) do
      add :price, :float
      add :type, :string
      add :comic_fk, :integer

      timestamps
    end

  end
end
