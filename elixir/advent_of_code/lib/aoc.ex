defmodule AOC do
  @moduledoc """
  `AdventOfCode` main module, containing mostly helpers.
  """

  def input(year, file) do
    raw_input(year, file)
    |> String.split("\n", trim: true)
  end

  def raw_input(year, file) do
    base_dir = :code.priv_dir(:advent_of_code)

    [base_dir, "inputs", "#{year}", file]
    |> Path.join()
    |> File.read!()
  end
end
