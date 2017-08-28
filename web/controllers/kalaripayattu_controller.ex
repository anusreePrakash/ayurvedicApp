defmodule SreeShasta.KalaripayattuController do
  use SreeShasta.Web, :controller

  alias SreeShasta.Kalaripayattu
  
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
