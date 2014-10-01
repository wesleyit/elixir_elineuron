defmodule Elineuron.Mixfile do
  use Mix.Project

  def project do
    [app: :elineuron,
     version: "0.0.1",
     # TODO: update to 1.0 final
     elixir: "~> 1.0.0-rc2",
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end
end
