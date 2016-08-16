defmodule PhoenixDistillery.PageController do
  use PhoenixDistillery.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
