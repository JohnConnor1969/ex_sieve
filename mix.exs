defmodule ExSieve.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_sieve,
      version: "0.6.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      package: package(),
      description: "Build filtred and sorted Ecto.Query struct from object based queries.",
      aliases: aliases(),
      deps: deps(),
      dialyzer: [plt_add_deps: :transitive],
      docs: [
        main: "readme",
        extras: [
          "README.md"
        ]
      ]
    ]
  end

  def application do
    [applications: applications(Mix.env)]
  end

  defp applications(:test), do: [:postgrex, :ecto, :logger, :ex_machina, :ex_unit]
  defp applications(_), do: [:logger]

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:credo, "~> 0.4", only: :dev},
      {:dialyxir, "~> 0.5", only: :dev},
      {:ex_machina, "~> 2.0", only: :test},
      {:ex_doc, "~> 0.15", only: :dev},
      {:postgrex, "~> 0.13", only: :test},
      {:ecto, "~> 2.1"}
    ]
  end

  defp aliases do
    [
      "ecto.reset": [
        "ecto.drop",
        "ecto.create",
        "ecto.migrate"
      ]
    ]
  end

  defp package do
    [
      maintainers: ["Vlad Alyukov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/valyukov/ex_sieve"},
      files: ["README.md", "LICENSE", "mix.exs", "lib/*", "CHANGELOG.md"]
    ]
  end
end
