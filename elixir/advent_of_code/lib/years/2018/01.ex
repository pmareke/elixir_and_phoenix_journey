defmodule AOC.Year2018.DayOne do
  def part_one do
    AOC.input(2018, "01.in")
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def part_two do
    AOC.input(2018, "01.in")
    |> Stream.cycle()
    |> Stream.map(&String.to_integer/1)
    |> Enum.reduce_while({0, MapSet.new()}, fn digit, {acc, seen} ->
      if MapSet.member?(seen, acc) do
        {:halt, acc}
      else
        {:cont, {digit + acc, MapSet.put(seen, acc)}}
      end
    end)
  end
end
