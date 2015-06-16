defmodule Comics.IllustratorTest do
  use Comics.ModelCase

  alias Comics.Illustrator

  @valid_attrs %{comic_fk: 42, firstname: "some content", lastname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Illustrator.changeset(%Illustrator{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Illustrator.changeset(%Illustrator{}, @invalid_attrs)
    refute changeset.valid?
  end
end
