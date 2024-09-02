defmodule AOC.Year2022.DayThree do
  def part_one do
    AOC.input(2022, "03.in")
    |> Enum.map(&parse/1)
    |> Enum.flat_map(&ruckstack/1)
    |> Enum.map(&score/1)
    |> Enum.sum()
  end

  defp parse(line) do
    chars = String.graphemes(line)
    middle = div(length(chars), 2)
    Enum.chunk_every(chars, middle)
  end

  def part_two do
    AOC.input(2022, "03.in")
    |> Enum.map(&String.graphemes/1)
    |> Enum.chunk_every(3)
    |> Enum.flat_map(&triple_ruckstack/1)
    |> Enum.map(&score/1)
    |> Enum.sum()
  end

  defp ruckstack([left, right]) do
    MapSet.intersection(MapSet.new(left), MapSet.new(right))
    |> MapSet.to_list()
  end

  defp triple_ruckstack([x, y, z]) do
    ruckstack([ruckstack([x, y]), z])
  end

  defp score(char) do
    lowers = for x <- ?a..?z, do: <<x::utf8>>
    uppers = for x <- ?A..?Z, do: <<x::utf8>>
    letters = lowers ++ uppers

    item =
      Enum.with_index(letters)
      |> List.keyfind(char, 0)
      |> elem(1)

    item + 1
  end
end
