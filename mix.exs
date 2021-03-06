defmodule BuildPermission.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      releases: releases(),
      deps: deps()
    ]
  end

  defp releases do
    [
      my_build: [
        applications: [
          runtime_tools: :permanent
        ],
        # have Mix automatically create a tarball after assembly
        steps: [:assemble, :tar]
      ]
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    []
  end
end
