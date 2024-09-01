defmodule AOC.Year2015.DayThree do
  def part_one do
    seen = MapSet.new() |> MapSet.put(%{x: 0, y: 0})

    AOC.raw_input(2015, "03.in")
    |> String.trim()
    |> String.graphemes()
    |> move_alone(seen)
  end

  defp move_alone(directions, seen, pos \\ %{x: 0, y: 0})
  defp move_alone([], seen, _pos), do: seen |> MapSet.size()

  defp move_alone([direction | rest], seen, pos) do
    new_pos = move(pos, direction)
    seen = seen |> MapSet.put(new_pos)
    move_alone(rest, seen, new_pos)
  end

  def part_two do
    seen = MapSet.new() |> MapSet.put(%{x: 0, y: 0})

    AOC.raw_input(2015, "03.in")
    |> String.trim()
    |> String.graphemes()
    |> move_with_robot(seen)
  end

  defp move_with_robot(directions, seen, pos \\ %{x: 0, y: 0}, robot_pos \\ %{x: 0, y: 0})
  defp move_with_robot([], seen, _pos, _robot_pos), do: seen |> MapSet.size()

  defp move_with_robot([direction, robot | rest], seen, pos, robot_pos) do
    new_pos = move(pos, direction)
    seen = seen |> MapSet.put(new_pos)

    new_robot_pos = move(robot_pos, robot)
    seen = seen |> MapSet.put(new_robot_pos)

    move_with_robot(rest, seen, new_pos, new_robot_pos)
  end

  defp move(pos, direction) do
    case direction do
      "^" -> %{pos | y: pos.y + 1}
      "v" -> %{pos | y: pos.y - 1}
      ">" -> %{pos | x: pos.x + 1}
      "<" -> %{pos | x: pos.x - 1}
    end
  end
end
