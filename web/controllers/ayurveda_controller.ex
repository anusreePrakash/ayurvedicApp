defmodule SreeShasta.AyurvedaController do
  use SreeShasta.Web, :controller

  alias SreeShasta.Ayurveda

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
