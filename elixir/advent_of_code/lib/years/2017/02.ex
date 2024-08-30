defmodule AOC.Year2017.DayTwo do
  def part_one do
    AOC.input(2017, "02.in")
    |> Enum.map(fn line ->
      line
      |> String.split(" ", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.min_max()
    end)
    |> Enum.map(fn {min, max} -> max - min end)
    |> Enum.sum()
  end

  def part_two do
    AOC.input(2017, "02.in")
    |> Enum.map(fn line ->
      line
      |> String.split(" ", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> find_divisible()
      |> Enum.min_max()
    end)
    |> Enum.map(fn {min, max} -> max / min end)
    |> Enum.sum()
  end

  defp find_divisible([head | tail]) do
    case is_divisible?([head | tail]) do
      nil -> find_divisible(tail)
      x -> [head, x]
    end
  end

  defp is_divisible?([head | tail]) do
    Enum.find(tail, fn x ->
      rem(head, x) == 0 or rem(x, head) == 0
    end)
  end
end
