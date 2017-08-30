defmodule MagicWeb.PageController do
  use MagicWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
