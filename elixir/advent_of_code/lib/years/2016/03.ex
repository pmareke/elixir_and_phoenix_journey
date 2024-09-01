defmodule AOC.Year2016.DayThree do
  def part_one do
    AOC.input(2016, "03.in")
    |> Enum.map(fn line ->
      line
      |> String.split(" ", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.count(&is_valid/1)
  end

  def part_two do
    AOC.input(2016, "03.in")
    |> Enum.map(fn line ->
      line
      |> String.split(" ", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.chunk_every(3)
    |> Enum.flat_map(&Enum.zip(&1))
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.count(&is_valid/1)
  end

  defp is_valid([a, b, c]) do
    a + b > c and a + c > b and b + c > a
  end
end
