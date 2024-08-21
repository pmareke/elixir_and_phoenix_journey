defmodule AOC.Year2016.DayOne do
  def part_one do
    AOC.raw_input(2016, "01.in")
    |> String.split(", ")
    |> Enum.map(&String.trim/1)
    |> positions
    |> final_position
    |> distance
  end

  def part_two do
    AOC.raw_input(2016, "01.in")
    |> String.split(", ")
    |> Enum.map(&String.trim/1)
    |> positions
    |> seen_position
    |> distance
  end

  defp positions(instructions, result \\ [])
  defp positions([], result), do: result |> Enum.reverse()

  defp positions(["R" <> num | tail], result),
    do: positions(tail, [{:R, num |> String.to_integer()} | result])

  defp positions(["L" <> num | tail], result),
    do: positions(tail, [{:L, num |> String.to_integer()} | result])

  def final_position(
        instructions,
        direction \\ :north,
        positions \\ [{0, 0}]
      )

  def final_position([], _dir, [{x, y} | _tail]), do: {x, y}

  def final_position([{turn, steps} | tail], dir, positions),
    do: final_position([{steps} | tail], update_direction(turn, dir), positions)

  def final_position([{0} | tail], dir, positions),
    do: final_position(tail, dir, positions)

  def final_position([{steps} | tail], dir, positions),
    do: final_position([{steps - 1} | tail], dir, positions |> move(dir))

  def seen_position(
        instructions,
        direction \\ :north,
        positions \\ [{0, 0}]
      )

  def seen_position([], _dir, [{x, y} | _tail]), do: {x, y}

  def seen_position([{turn, steps} | tail], dir, positions),
    do: seen_position([{steps} | tail], update_direction(turn, dir), positions)

  def seen_position([{0} | tail], dir, [last | rest] = positions) do
    if rest |> Enum.member?(last) do
      seen_position([], dir, positions)
    else
      seen_position(tail, dir, positions)
    end
  end

  def seen_position([{steps} | tail], dir, [last | rest] = positions) do
    if rest |> Enum.member?(last) do
      seen_position([], dir, positions)
    else
      seen_position([{steps - 1} | tail], dir, positions |> move(dir))
    end
  end

  def update_direction(:R, :north), do: :east
  def update_direction(:R, :east), do: :south
  def update_direction(:R, :south), do: :west
  def update_direction(:R, :west), do: :north
  def update_direction(:L, :north), do: :west
  def update_direction(:L, :east), do: :north
  def update_direction(:L, :south), do: :east
  def update_direction(:L, :west), do: :south

  def move([{x, y} | tail], :north), do: [{x, y - 1}, {x, y} | tail]
  def move([{x, y} | tail], :east), do: [{x + 1, y}, {x, y} | tail]
  def move([{x, y} | tail], :south), do: [{x, y + 1}, {x, y} | tail]
  def move([{x, y} | tail], :west), do: [{x - 1, y}, {x, y} | tail]

  def distance({x, y}), do: abs(x) + abs(y)
end
