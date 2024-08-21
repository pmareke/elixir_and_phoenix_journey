defmodule AOC.Year2020.DayOne do
  def part_one do
    AOC.input(2020, "01.in")
    |> Stream.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> find_two_entries_that_sum_to_2020()
    |> Enum.reduce(&Kernel.*/2)
  end

  def part_two do
    AOC.input(2020, "01.in")
    |> Stream.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> find_three_entries_that_sum_to_2020()
    |> Enum.at(0)
    |> Enum.reduce(&Kernel.*/2)
  end

  defp find_two_entries_that_sum_to_2020(data) do
    Enum.reduce(data, [], fn x, acc ->
      if Enum.member?(data, 2020 - x) do
        [x, 2020 - x]
      else
        acc
      end
    end)
  end

  defp find_three_entries_that_sum_to_2020(data) do
    for a <- data,
        b <- data,
        c <- data,
        a + b + c == 2020,
        do: [a, b, c]
  end
end
