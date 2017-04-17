defmodule Expyplot.Mixfile do
  use Mix.Project

  @version "1.0.1"

  def project do
    [app: :expyplot,
     version: @version,
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     docs: docs(),
     package: package(),
     description: description(),
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {Expyplot, []},
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:statistics, "~> 0.4.1"},
      {:earmark, "~> 0.1"},
      {:ex_doc, "~> 0.11"},
    ]
  end

  defp docs do
    [main: "Expyplot.Plot"]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "config", "priv", "examples", "LICENSE"],
      maintainers: ["Max Strange"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/MaxStrange/expyplot"}
    ]
  end

  defp description do
    """
    Python's matplotlib.pyplot ported to Elixir. Inspired by https://github.com/JordiPolo/explot

    This library provides a fairly transparent wrapper for matplotlib.pyplot.
    """
  end
end
