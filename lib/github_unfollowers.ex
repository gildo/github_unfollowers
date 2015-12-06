defmodule GithubUnfollowers do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(GithubUnfollowers.Worker, [arg1, arg2, arg3]),
      worker(__MODULE__, [], function: :run),
      worker(Repo, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GithubUnfollowers.Supervisor]
    Tentacat.start
    Supervisor.start_link(children, opts)
  end

  def run do
    { :ok, _ } = Plug.Adapters.Cowboy.http GithubUnfollowers.Router, []
  end
end

defmodule Repo do
  use Ecto.Repo,
    otp_app: :github_unfollowers
end
