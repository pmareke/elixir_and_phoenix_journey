defmodule AOC.Year2021.DayTwo do
  def part_one do
    AOC.input(2021, "02.in")
    |> Enum.reduce([0, 0], &move/2)
    |> Enum.product()
  end

  defp move("forward " <> number, [horizontal, depth]),
    do: [horizontal + String.to_integer(number), depth]

  defp move("down " <> number, [horizontal, depth]),
    do: [horizontal, depth + String.to_integer(number)]

  defp move("up " <> number, [horizontal, depth]),
    do: [horizontal, depth - String.to_integer(number)]

  def part_two do
    AOC.input(2021, "02.in")
    |> Enum.reduce([0, 0, 0], &move_with_aim/2)
    |> Enum.take(2)
    |> Enum.product()
  end

  defp move_with_aim("forward " <> number, [horizontal, depth, aim]) do
    value = String.to_integer(number)
    [horizontal + value, depth + value * aim, aim]
  end

  defp move_with_aim("down " <> number, [horizontal, depth, aim]),
    do: [horizontal, depth, aim + String.to_integer(number)]

  defp move_with_aim("up " <> number, [horizontal, depth, aim]),
    do: [horizontal, depth, aim - String.to_integer(number)]
end
