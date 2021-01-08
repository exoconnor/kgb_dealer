defmodule KgbDealer.MixProject do
  use Mix.Project

  def project do
    [
      app: :kgb_dealer,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {KgbDealer.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:crawly, "~> 0.12.0"},
      {:floki, "0.29.0"},
      {:veritaserum, path: "vendor/veritaserum"}
    ]
  end
end
