defmodule AOC.Year2016.DayTwo do
  def part_one do
    AOC.input(2016, "02.in")
    |> Enum.map(&String.graphemes/1)
    |> Enum.reduce([], fn instructions, acc ->
      last = acc |> List.last() || [1, 1]
      acc ++ [solve(instructions, last)]
    end)
    |> IO.inspect()
    |> Enum.map(&to_keypad/1)
    |> Enum.join()
  end

  def part_two do
    AOC.input(2016, "02.in")
    0
  end

  defp solve(instructions, last) do
    instructions
    |> Enum.reduce(last, fn instruction, acc ->
      move(instruction, acc)
    end)
  end

  defp move(direction, [x, y]) do
    next =
      case direction do
        "D" -> [x + 1, y]
        "U" -> [x - 1, y]
        "R" -> [x, y + 1]
        "L" -> [x, y - 1]
      end

    pos = to_keypad(next)
    if pos != nil, do: next, else: [x, y]
  end

  defp to_keypad([x, y]) do
    if abs(x) > 1 || abs(y) > 1 do
      nil
    else
      keypad = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]

      Enum.at(Enum.at(keypad, x), y)
    end
  end
end
