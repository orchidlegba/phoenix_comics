defmodule Comics.CurrencyControllerTest do
  use Comics.ConnCase

  alias Comics.Currency
  @valid_attrs %{comic_fk: 42, price: "120.5", type: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, currency_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    currency = Repo.insert %Currency{}
    conn = get conn, currency_path(conn, :show, currency)
    assert json_response(conn, 200)["data"] == %{
      "id" => currency.id
    }
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, currency_path(conn, :create), currency: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Currency, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, currency_path(conn, :create), currency: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    currency = Repo.insert %Currency{}
    conn = put conn, currency_path(conn, :update, currency), currency: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Currency, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    currency = Repo.insert %Currency{}
    conn = put conn, currency_path(conn, :update, currency), currency: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    currency = Repo.insert %Currency{}
    conn = delete conn, currency_path(conn, :delete, currency)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Currency, currency.id)
  end
end
