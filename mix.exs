defmodule UeberauthLine.Mixfile do
  use Mix.Project
    @version "0.1.1"
    @url "https://github.com/alexfilatov/ueberauth_line"

  def project do
    [
      app: :ueberauth_line,
      version: @version,
      name: "Ueberauth LINE Strategy",
      package: package,
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      source_url: @url,
      homepage_url: @url,
      description: description,
      deps: deps(),
      docs: docs
    ]
  end

  def application do
    [applications: [:logger, :oauth2, :ueberauth]]
  end

    defp deps do
      [
        {:ueberauth, github: "ueberauth/ueberauth", ref: "5b34fadfdf696dd1e25f4d3317634e619dcae35e", override: true},
        {:oauth2, "~> 0.5"},
        {:ex_doc, "~> 0.1", only: :dev},
        {:earmark, ">= 0.0.0", only: :dev},
        {:dogma, ">= 0.0.0", only: [:dev, :test]}
      ]
    end

    defp docs do
      [extras: docs_extras, main: "extra-readme"]
    end

    defp docs_extras do
      ["README.md"]
    end

    defp description do
      "An Uberauth strategy for LINE authentication."
    end

    defp package do
      [
        files: ["lib", "mix.exs", "README.md", "LICENSE"],
        maintainers: ["Alex Filatov"],
        licenses: ["MIT"],
        links: %{"GitHub": @url}
      ]
    end

end
