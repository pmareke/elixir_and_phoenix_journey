defmodule AOC.Year2022.DayOne do
  def part_one do
    AOC.raw_input(2022, "01.in")
    |> find_blocks(1)
    |> Enum.sum()
  end

  def part_two do
    AOC.raw_input(2022, "01.in")
    |> find_blocks(3)
    |> Enum.sum()
  end

  defp find_blocks(input, number) do
    input
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(fn block ->
      block
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()
    end)
    |> Enum.sort(:desc)
    |> Enum.take(number)
  end
end
