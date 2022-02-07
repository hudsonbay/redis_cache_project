defmodule RedisCacheProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :redis_cache_project,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RedisCacheProject.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:redix, "~> 1.1"},
      {:castore, ">= 0.0.0"}
    ]
  end
end
