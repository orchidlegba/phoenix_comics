defmodule Comics.CurrencyController do
  use Comics.Web, :controller

  alias Comics.Currency

  plug :scrub_params, "currency" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    currencies = Repo.all(Currency)
    render(conn, "index.json", currencies: currencies)
  end

  def create(conn, %{"currency" => currency_params}) do
    changeset = Currency.changeset(%Currency{}, currency_params)

    if changeset.valid? do
      currency = Repo.insert(changeset)
      render(conn, "show.json", currency: currency)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Comics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    currency = Repo.get(Currency, id)
    render conn, "show.json", currency: currency
  end

  def update(conn, %{"id" => id, "currency" => currency_params}) do
    currency = Repo.get(Currency, id)
    changeset = Currency.changeset(currency, currency_params)

    if changeset.valid? do
      currency = Repo.update(changeset)
      render(conn, "show.json", currency: currency)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Comics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    currency = Repo.get(Currency, id)

    currency = Repo.delete(currency)
    render(conn, "show.json", currency: currency)
  end
end
