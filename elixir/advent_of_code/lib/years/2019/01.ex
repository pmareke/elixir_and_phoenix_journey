defmodule AOC.Year2019.DayOne do
  def part_one do
    AOC.input(2019, "01.in")
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&calculate/1)
    |> Enum.sum()
  end

  def part_two do
    AOC.input(2019, "01.in")
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&recursive_calculate/1)
    |> Enum.sum()
  end

  defp recursive_calculate(mass, acc \\ 0)
  defp recursive_calculate(mass, acc) when mass < 0, do: acc

  defp recursive_calculate(mass, acc) do
    left_mass = calculate(mass)

    if left_mass > 0, do: recursive_calculate(left_mass, acc + left_mass), else: acc
  end

  defp calculate(mass) do
    (mass |> div(3)) - 2
  end
end
