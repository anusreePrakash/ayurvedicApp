defmodule SreeShasta.YogaController do
  use SreeShasta.Web, :controller

  alias SreeShasta.Yoga

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
