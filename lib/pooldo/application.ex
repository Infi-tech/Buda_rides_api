defmodule Pooldo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Pooldo.Repo,
      # Start the endpoint when the application starts
      PooldoWeb.Endpoint
      # Starts a worker by calling: Pooldo.Worker.start_link(arg)
      # {Pooldo.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pooldo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PooldoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
