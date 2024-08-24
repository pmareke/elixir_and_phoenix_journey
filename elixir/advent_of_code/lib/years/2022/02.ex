defmodule AOC.Year2022.DayTwo do
  def part_one do
    AOC.input(2022, "02.in")
    |> Enum.map(&play/1)
    |> Enum.sum()
  end

  # To lose against paper, the opponent must play rock (1)
  defp play("B X"), do: 1
  # To lose against scissors, the opponent must play paper (2)
  defp play("C Y"), do: 2
  # To lose against rock, the opponent must play scissors (3)
  defp play("A Z"), do: 3
  # To draw against rock, the opponent must play rock (3 + 1)
  defp play("A X"), do: 4
  # To draw against paper, the opponent must play paper (3 + 2)
  defp play("B Y"), do: 5
  # To draw against scissors, the opponent must play scissors (3 + 3)
  defp play("C Z"), do: 6
  # To win against siccors, the opponent must play rock (6 + 1)
  defp play("C X"), do: 7
  # To win against rock, the opponent must play paper (6 + 2)
  defp play("A Y"), do: 8
  # To win against paper, the opponent must play scissors (6 + 3)
  defp play("B Z"), do: 9

  def part_two do
    AOC.input(2022, "02.in")
    |> Enum.map(&trick/1)
    |> Enum.sum()
  end

  # Paper wins my rock (1)
  defp trick("B X"), do: 1
  # Scissors wins my paper (2)
  defp trick("C X"), do: 2
  # Rock wins my scissors (3)
  defp trick("A X"), do: 3
  # Rock draw my rock (3 + 1)
  defp trick("A Y"), do: 4
  # Paper draw my paper (3 + 2)
  defp trick("B Y"), do: 5
  # Scissors draw my scissors (3 + 3)
  defp trick("C Y"), do: 6
  # Scissors lose my rock (6 + 1)
  defp trick("C Z"), do: 7
  # Rock lose my paper (6 + 2)
  defp trick("A Z"), do: 8
  # Parer lose my scissors (6 + 3)
  defp trick("B Z"), do: 9
end
