defmodule Comics.IllustratorControllerTest do
  use Comics.ConnCase

  alias Comics.Illustrator
  @valid_attrs %{comic_fk: 42, firstname: "some content", lastname: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, illustrator_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    illustrator = Repo.insert %Illustrator{}
    conn = get conn, illustrator_path(conn, :show, illustrator)
    assert json_response(conn, 200)["data"] == %{
      "id" => illustrator.id
    }
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, illustrator_path(conn, :create), illustrator: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Illustrator, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, illustrator_path(conn, :create), illustrator: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    illustrator = Repo.insert %Illustrator{}
    conn = put conn, illustrator_path(conn, :update, illustrator), illustrator: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Illustrator, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    illustrator = Repo.insert %Illustrator{}
    conn = put conn, illustrator_path(conn, :update, illustrator), illustrator: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    illustrator = Repo.insert %Illustrator{}
    conn = delete conn, illustrator_path(conn, :delete, illustrator)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Illustrator, illustrator.id)
  end
end
