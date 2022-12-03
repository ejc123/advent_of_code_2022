# Part 1


{_, sums} = File.stream!("input.txt")
            |> Enum.reduce({0, []}, fn input, {acc, result} ->
               case input do
                 "\n" -> {0, [acc | result]}
                 _ -> {(String.trim(input) |> String.to_integer) + acc, result}
               end
            end)

IO.puts("Part 1: #{Enum.max(sums)}")

# Part 2
output = sums |> Enum.sort(:desc) |> Enum.take(3) |> Enum.sum
IO.puts("Part 2: #{output}")
