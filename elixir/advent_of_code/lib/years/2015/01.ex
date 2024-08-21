defmodule AOC.Year2015.DayOne do
  def part_one do
    AOC.raw_input(2015, "01.in")
    |> String.trim()
    |> calulate
  end

  def calulate(<<>>), do: 0
  def calulate(<<?(, rest::binary>>), do: 1 + calulate(rest)
  def calulate(<<?), rest::binary>>), do: -1 + calulate(rest)

  def part_two do
    AOC.raw_input(2015, "01.in")
    |> String.trim()
    |> find_basement(0, 0)
  end

  # The next movement will go to the basement
  defp find_basement(<<?), _::binary>>, 0, pos), do: pos + 1

  defp find_basement(<<?), rest::binary>>, floor, pos),
    do: find_basement(rest, floor - 1, pos + 1)

  defp find_basement(<<?(, rest::binary>>, floor, pos),
    do: find_basement(rest, floor + 1, pos + 1)
end
