defmodule HofladenWeb.PageController do
  use HofladenWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
