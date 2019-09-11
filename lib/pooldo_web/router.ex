defmodule PooldoWeb.Router do
  use PooldoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PooldoWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
