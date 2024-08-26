defmodule AOC.Year2015.DayTwo do
  def part_one do
    AOC.input(2015, "02.in")
    |> Enum.reduce(0, fn line, acc ->
      acc + calculate(parse_line(line))
    end)
  end

  def part_two do
    AOC.input(2015, "02.in")
    |> Enum.reduce(0, fn line, acc ->
      acc + calculate_extra(parse_line(line))
    end)
  end

  defp parse_line(line) do
    %{"l" => l, "w" => w, "h" => h} =
      Regex.named_captures(~r/^(?<l>\d+)x(?<w>\d+)x(?<h>\d+)/, line)

    l = String.to_integer(l)
    w = String.to_integer(w)
    h = String.to_integer(h)

    [l, w, h]
  end

  defp calculate([l, w, h]) do
    s1 = l * w
    s2 = w * h
    s3 = h * l
    smallest_side = Enum.min([s1, s2, s3])

    (s1 + s2 + s3) * 2 + smallest_side
  end

  defp calculate_extra(sides) do
    sides = Enum.sort(sides)
    smallest = Enum.take(sides, 2)
    bow = Enum.product(sides)

    Enum.sum(smallest) * 2 + bow
  end
end
