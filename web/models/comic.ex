defmodule Comics.Comic do
  use Comics.Web, :model

  schema "comics" do
    field :title, :string
    has_many :authors, Author
    has_many :illustrators, Illustrator
    has_one :currency, Currency

    timestamps
  end

  @required_fields ~w(title)
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
