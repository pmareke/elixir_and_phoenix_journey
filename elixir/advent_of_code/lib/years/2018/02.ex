defmodule AOC.Year2018.DayTwo do
  def part_one do
    valid =
      AOC.input(2018, "02.in")
      |> Enum.map(fn line ->
        line
        |> String.graphemes()
        |> Enum.frequencies()
        |> Map.values()
      end)

    times(valid, 2) * times(valid, 3)
  end

  defp times(valid, target) do
    valid
    |> Enum.count(fn x -> Enum.member?(x, target) end)
  end

  def part_two do
    AOC.input(2018, "02.in")
    |> common_letters()
      
  end

  defp common_letters(ids) do
    [[a, b]] = differences_of_one(ids)

    [String.codepoints(a), String.codepoints(b)]
    |> Enum.zip()
    |> Enum.reject(fn {a, b} -> a != b end)
    |> Enum.map(fn {a, _} -> a end)
    |> Enum.join
  end

  defp differences_of_one(ids) do
    combinations = for a <- ids, b <- ids, do: Enum.sort([a, b])
    Enum.filter(Enum.uniq(combinations), fn [a, b] ->
      differences(a, b) == 1
    end)
  end

  defp differences(a, b) do
    [String.codepoints(a), String.codepoints(b)]
    |> Enum.zip()
    |> Enum.count(fn {a, b} -> a != b end)
  end

end
