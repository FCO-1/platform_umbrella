defmodule Back.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Back.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Back.PubSub}
      # Start a worker by calling: Back.Worker.start_link(arg)
      # {Back.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Back.Supervisor)
  end
end
