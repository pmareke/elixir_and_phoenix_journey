defmodule AOC.Year2018.DayThree do
  def part_one do
    AOC.input(2018, "03.in")
    |> Enum.map(&parse/1)
    |> claims_per_square_inch()
    |> Map.values()
    |> Enum.count(&(&1 > 1))
  end

  def part_two do
    input =
      AOC.input(2018, "03.in")
      |> Enum.map(&parse/1)

    claim_map = claims_per_square_inch(input)

    Enum.find(input, fn %{coord: coord, size: size} ->
      claims(coord, size)
      |> Enum.all?(fn pos -> claim_map[pos] == 1 end)
    end)
    |> (& &1[:id]).()
  end

  defp parse(line) do
    [_ | tail] = Regex.run(~r/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/, line)

    [id, x, y, wide, tall] =
      tail
      |> Enum.map(&String.to_integer/1)

    %{id: id, coord: {x, y}, size: {wide, tall}}
  end

  defp claims_per_square_inch(input) do
    Enum.reduce(input, %{}, fn %{id: _id, coord: coord, size: size}, acc ->
      claims(coord, size)
      |> Enum.reduce(acc, fn pos, acc -> Map.update(acc, pos, 1, &(&1 + 1)) end)
    end)
  end

  defp claims({x, y}, {width, height}) do
    for x <- x..(x + width - 1), y <- y..(y + height - 1), do: {x, y}
  end
end
