defmodule AOC.Year2023.DayTwo do
  @max_cubes [red: 12, green: 13, blue: 14]

  def part_one do
    AOC.input(2023, "02.in")
    |> Enum.map(&parse_line/1)
    |> exclude_invalid_takes
    |> Enum.reduce(0, fn %{id: number}, acc -> acc + number end)
  end

  def part_two do
    AOC.input(2023, "02.in")
    |> Enum.map(&parse_line/1)
    |> Enum.map(fn %{takes: takes} ->
      min_red = min_by_color(takes, :red)
      min_green = min_by_color(takes, :green)
      min_blue = min_by_color(takes, :blue)
      min_red * min_green * min_blue
    end)
    |> Enum.sum()
  end

  defp parse_line(line) do
    %{"id" => id, "rest" => rest} = Regex.named_captures(~r/^Game (?<id>\d+): (?<rest>.*)/, line)

    takes =
      rest
      |> String.split(";")
      |> Enum.map(&String.trim/1)
      |> Enum.map(fn group ->
        String.split(group, ", ")
        |> Enum.map(fn play ->
          String.split(play, " ")
          |> case do
            [number, "red"] -> {:red, String.to_integer(number)}
            [number, "blue"] -> {:blue, String.to_integer(number)}
            [number, "green"] -> {:green, String.to_integer(number)}
          end
        end)
        |> Enum.into(%{})
      end)

    %{id: String.to_integer(id), takes: takes}
  end

  defp exclude_invalid_takes(line) do
    line
    |> Enum.filter(fn %{takes: takes} ->
      Enum.all?(takes, fn take ->
        Enum.all?(take, fn {color, amount} -> amount <= @max_cubes[color] end)
      end)
    end)
  end

  defp min_by_color(takes, color) do
    takes
    |> Enum.filter(&Map.get(&1, color))
    |> Enum.map(&Map.get(&1, color))
    |> Enum.max()
  end
end
