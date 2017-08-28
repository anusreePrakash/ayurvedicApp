defmodule SreeShasta.Router do
  use SreeShasta.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SreeShasta do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/appoinments", AppoinmentController
    resources "/contacts", ContactController
    resources "/aboutus", AboutusController
    resources "/ayurveda", AyurvedaController
    resources "/kalaripayattu", KalaripayattuController
    resources "/yoga", YogaController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SreeShasta do
  #   pipe_through :api
  # end
end
