defmodule GithubUnfollowers.Mixfile do
  use Mix.Project

  def project do
    [app: :github_unfollowers,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:cowboy, :plug, :logger, :tentacat, :postgrex, :ecto],
     mod: {GithubUnfollowers, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:cowboy, "~> 1.0.0"},
     {:plug, "~> 1.0"},
     {:tentacat, "~> 0.2"},
     {:postgrex, ">= 0.10.0"},
     {:ecto, github: "elixir-lang/ecto"}
   ]
  end

end
