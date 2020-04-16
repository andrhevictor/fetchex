defmodule Fetchex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Fetchex.Repo,
      FetchexWeb.Endpoint
      # Starts a worker by calling: Fetchex.Worker.start_link(arg)
      # {Fetchex.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fetchex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FetchexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
