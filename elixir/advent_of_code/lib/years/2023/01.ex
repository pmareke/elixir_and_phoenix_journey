defmodule AOC.Year2023.DayOne do
  def part_one do
    AOC.input(2023, "01.in")
    |> find_numbers(&simple_decoder/1)
    |> Enum.reduce(0, &+/2)
  end

  def part_two do
    AOC.input(2023, "01.in")
    |> find_numbers(&extra_decoder/1)
    |> Enum.reduce(0, &+/2)
  end

  defp find_numbers(input, decoder) do
    input
    |> Enum.map(fn line ->
      numbers_found = decoder.(line)
      List.first(numbers_found) * 10 + List.last(numbers_found)
    end)
  end

  def simple_decoder(line, acc \\ [])
  def simple_decoder(<<?1, rest::binary>>, acc), do: simple_decoder(rest, [1 | acc])
  def simple_decoder(<<?2, rest::binary>>, acc), do: simple_decoder(rest, [2 | acc])
  def simple_decoder(<<?3, rest::binary>>, acc), do: simple_decoder(rest, [3 | acc])
  def simple_decoder(<<?4, rest::binary>>, acc), do: simple_decoder(rest, [4 | acc])
  def simple_decoder(<<?5, rest::binary>>, acc), do: simple_decoder(rest, [5 | acc])
  def simple_decoder(<<?6, rest::binary>>, acc), do: simple_decoder(rest, [6 | acc])
  def simple_decoder(<<?7, rest::binary>>, acc), do: simple_decoder(rest, [7 | acc])
  def simple_decoder(<<?8, rest::binary>>, acc), do: simple_decoder(rest, [8 | acc])
  def simple_decoder(<<?9, rest::binary>>, acc), do: simple_decoder(rest, [9 | acc])
  def simple_decoder(<<_::binary-size(1), rest::binary>>, acc), do: simple_decoder(rest, acc)
  def simple_decoder("", acc), do: Enum.reverse(acc)

  def extra_decoder(line, acc \\ [])
  def extra_decoder(<<"one", rest::binary>>, acc), do: extra_decoder("e" <> rest, [1 | acc])
  def extra_decoder(<<"two", rest::binary>>, acc), do: extra_decoder("o" <> rest, [2 | acc])
  def extra_decoder(<<"three", rest::binary>>, acc), do: extra_decoder("e" <> rest, [3 | acc])
  def extra_decoder(<<"four", rest::binary>>, acc), do: extra_decoder("r" <> rest, [4 | acc])
  def extra_decoder(<<"five", rest::binary>>, acc), do: extra_decoder("e" <> rest, [5 | acc])
  def extra_decoder(<<"six", rest::binary>>, acc), do: extra_decoder("x" <> rest, [6 | acc])
  def extra_decoder(<<"seven", rest::binary>>, acc), do: extra_decoder("n" <> rest, [7 | acc])
  def extra_decoder(<<"eight", rest::binary>>, acc), do: extra_decoder("t" <> rest, [8 | acc])
  def extra_decoder(<<"nine", rest::binary>>, acc), do: extra_decoder("e" <> rest, [9 | acc])
  def extra_decoder("", acc), do: Enum.reverse(acc)

  def extra_decoder(<<character::binary-size(1), rest::binary>>, acc) do
    new_acc = simple_decoder(character)
    extra_decoder(rest, new_acc ++ acc)
  end
end
