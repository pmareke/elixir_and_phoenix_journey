defmodule AOC.Year2020.DayTwo do
  def part_one do
    AOC.input(2020, "02.in")
    |> Enum.map(&parse_line/1)
    |> Enum.count(&valid?/1)
  end

  def part_two do
    AOC.input(2020, "02.in")
    |> Enum.map(&parse_line/1)
    |> Enum.count(&complex_valid?/1)
  end

  defp parse_line(line) do
    %{
      "from" => from,
      "to" => to,
      "letter" => letter,
      "password" => password
    } = Regex.named_captures(~r/^(?<from>\d+)-(?<to>\d+) (?<letter>\w): (?<password>.*)/, line)

    {String.to_integer(from), String.to_integer(to), letter, String.graphemes(password)}
  end

  defp valid?({from, to, letter, letters}) do
    freq = Enum.frequencies(letters)
    freq[letter] in from..to
  end

  defp complex_valid?({from, to, letter, letters}) do
    Enum.at(letters, to - 1) != Enum.at(letters, from - 1) and
      letter in [Enum.at(letters, from - 1), Enum.at(letters, to - 1)]
  end
end
