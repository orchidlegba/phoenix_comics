defmodule Comics.ToolsController do
  use Comics.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
