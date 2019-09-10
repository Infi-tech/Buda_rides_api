defmodule Pooldo.Repo do
  use Ecto.Repo,
    otp_app: :pooldo,
    adapter: Ecto.Adapters.Postgres
end
