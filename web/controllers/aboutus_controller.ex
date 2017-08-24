defmodule SreeShasta.AboutusController do
  use SreeShasta.Web, :controller

  alias SreeShasta.Aboutus

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
