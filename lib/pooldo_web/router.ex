defmodule PooldoWeb.Router do
  use PooldoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :api_auth do
    plug :ensure_authenticated
  end

   scope "/api", PooldoWeb do
    pipe_through :api
    post "/users/sign_in", UserController, :sign_in
  end

  scope "/api", PooldoWeb do
    pipe_through [:api,:api_auth]
    resources "/users", UserController, except: [:new, :edit]
   
  end


  # Plug function
  defp ensure_authenticated(conn,_opts) do
    current_user_id = get_session(conn, :current_user_id)

    if current_user_id do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> put_view(PooldoWeb.ErrorView)
      |> render("401.json", message: "Unauthenicated user")
      |> halt()
    end
  end
end
