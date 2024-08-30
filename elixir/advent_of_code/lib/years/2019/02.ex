defmodule AOC.Year2019.DayTwo do
  def part_one do
    instructions = AOC.raw_input(2019, "02.in")
    |> String.trim()
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
    
    run_program(instructions, 12, 2)
  end

  def part_two do
    instruction = AOC.raw_input(2019, "02.in")
    |> String.trim()
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)

    Enum.reduce(0..99, nil, fn noun, acc ->
      Enum.reduce(0..99, acc, fn verb, acc ->
      case run_program(instruction, noun, verb) do
        19690720 -> (100 * noun) + verb
        _ -> acc
      end
      end)
    end)

  end

  defp run_program(program, noun, verb) do
    program
    |> List.replace_at(1, noun)
    |> List.replace_at(2, verb)
    |> run
  end

  defp run(program) do
    program
    |> Enum.chunk_every(4, 4, :discard)
    |> Enum.reduce(program, fn [opcode, a, b, c], program ->
      case opcode do
        1 -> sum(program, a, b, c)
        2 -> multiply(program, a, b, c)
        99 -> Enum.at(program, 0)
      end
    end)
  end

  defp sum(program, a, b, c) do
    program
    |> List.replace_at(c, Enum.at(program, a) + Enum.at(program, b))
  end

  defp multiply(program, a, b, c) do
    program
    |> List.replace_at(c, Enum.at(program, a) * Enum.at(program, b))
  end
end
