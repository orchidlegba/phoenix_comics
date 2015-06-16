defmodule Comics.CurrencyTest do
  use Comics.ModelCase

  alias Comics.Currency

  @valid_attrs %{comic_fk: 42, price: "120.5", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Currency.changeset(%Currency{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Currency.changeset(%Currency{}, @invalid_attrs)
    refute changeset.valid?
  end
end
