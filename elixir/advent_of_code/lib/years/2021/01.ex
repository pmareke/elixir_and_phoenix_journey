defmodule AOC.Year2021.DayOne do
  def part_one do
    AOC.input(2021, "01.in")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> increases
  end

  defp increases(numbers, acc \\ 0)

  defp increases([first, second | rest], acc) when first < second,
    do: increases([second | rest], acc + 1)

  defp increases([_, second | rest], acc), do: increases([second | rest], acc)
  defp increases([_], acc), do: acc

  def part_two do
    AOC.input(2021, "01.in")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> big_increases
  end

  defp big_increases(numbers, acc \\ 0)

  defp big_increases([first, second, third, fourth | rest], acc) when first < fourth,
    do: big_increases([second, third, fourth | rest], acc + 1)

  defp big_increases([_, second, third, fourth | rest], acc), do: big_increases([second, third, fourth | rest], acc)
  defp big_increases([_, _, _], acc), do: acc
end
