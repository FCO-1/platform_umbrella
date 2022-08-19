defmodule Platform.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Platform.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Platform.PubSub}
      # Start a worker by calling: Platform.Worker.start_link(arg)
      # {Platform.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Platform.Supervisor)
  end
end
