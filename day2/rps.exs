defmodule Rps do
  def score1(line) do
    case line do
      "A X" -> 1 + 3
      "A Y" -> 2 + 6
      "A Z" -> 3 + 0
      "B X" -> 1 + 0
      "B Y" -> 2 + 3
      "B Z" -> 3 + 6
      "C X" -> 1 + 6
      "C Y" -> 2 + 0
      "C Z" -> 3 + 3
      _ -> 0
    end
  end
  def score2(line) do
    case line do
      "A X" -> 3 + 0
      "A Y" -> 1 + 3
      "A Z" -> 2 + 6
      "B X" -> 1 + 0
      "B Y" -> 2 + 3
      "B Z" -> 3 + 6
      "C X" -> 2 + 0
      "C Y" -> 3 + 3
      "C Z" -> 1 + 6
      _ -> 0
    end
  end
end

# Part 1
score = File.stream!("input.txt")
        |> Stream.map(&String.trim/1)
|> Enum.reduce(0, fn x, acc ->
  acc + Rps.score1(x)
end)

IO.puts("Part 1: #{score}")

# Part 2
score = File.stream!("input.txt")
        |> Stream.map(&String.trim/1)
|> Enum.reduce(0, fn x, acc ->
  acc + Rps.score2(x)
end)

IO.puts("Part 2: #{score}")
