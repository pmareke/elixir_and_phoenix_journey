defmodule AOC.Year2017.DayOne do
  def part_one do
    AOC.raw_input(2017, "01.in")
    |> String.trim()
    |> copy_first_digit_to_end()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> find_uniq()
    |> Enum.sum()
  end

  defp copy_first_digit_to_end(digits), do: digits <> String.first(digits)

  defp find_uniq(digits, acc \\ [])

  defp find_uniq([first, second | rest], acc) when first == second,
    do: find_uniq([second | rest], [first | acc])

  defp find_uniq([first, second | rest], acc) when first != second,
    do: find_uniq([second | rest], acc)

  defp find_uniq(_, acc), do: acc

  def part_two do
    AOC.raw_input(2017, "01.in")
    |> String.trim()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> do_halfway_sum()
  end

  defp do_halfway_sum(digits) do
    digit_cycle = Stream.cycle(digits)
    halfway = digits |> length |> div(2)

    Enum.reduce(Enum.with_index(digits), 0, fn {digit, index}, acc ->
      case Enum.at(digit_cycle, index + halfway) do
        ^digit -> acc + digit
        _ -> acc
      end
    end)
  end
end
