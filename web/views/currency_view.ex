defmodule Comics.CurrencyView do
  use Comics.Web, :view

  def render("index.json", %{currencies: currencies}) do
    %{data: render_many(currencies, "currency.json")}
  end

  def render("show.json", %{currency: currency}) do
    %{data: render_one(currency, "currency.json")}
  end

  def render("currency.json", %{currency: currency}) do
    %{id: currency.id}
  end
end
