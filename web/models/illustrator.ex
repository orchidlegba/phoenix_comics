defmodule Comics.Illustrator do
  use Comics.Web, :model

  schema "illustrators" do
    field :firstname, :string
    field :lastname, :string
    field :comic_fk, :integer

    timestamps
  end

  @required_fields ~w(firstname lastname comic_fk)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
