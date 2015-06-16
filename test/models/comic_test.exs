defmodule Comics.ComicTest do
  use Comics.ModelCase

  alias Comics.Comic

  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Comic.changeset(%Comic{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Comic.changeset(%Comic{}, @invalid_attrs)
    refute changeset.valid?
  end
end
