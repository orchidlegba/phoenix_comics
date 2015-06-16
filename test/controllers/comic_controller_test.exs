defmodule Comics.ComicControllerTest do
  use Comics.ConnCase

  alias Comics.Comic
  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, comic_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    comic = Repo.insert %Comic{}
    conn = get conn, comic_path(conn, :show, comic)
    assert json_response(conn, 200)["data"] == %{
      "id" => comic.id
    }
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, comic_path(conn, :create), comic: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Comic, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, comic_path(conn, :create), comic: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    comic = Repo.insert %Comic{}
    conn = put conn, comic_path(conn, :update, comic), comic: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Comic, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    comic = Repo.insert %Comic{}
    conn = put conn, comic_path(conn, :update, comic), comic: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    comic = Repo.insert %Comic{}
    conn = delete conn, comic_path(conn, :delete, comic)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Comic, comic.id)
  end
end
