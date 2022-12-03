lookup = %{
  'a' => 1,
  'b' => 2,
  'c' => 3,
  'd' => 4,
  'e' => 5,
  'f' => 6,
  'g' => 7,
  'h' => 8,
  'i' => 9,
  'j' => 10,
  'k' => 11,
  'l' => 12,
  'm' => 13,
  'n' => 14,
  'o' => 15,
  'p' => 16,
  'q' => 17,
  'r' => 18,
  's' => 19,
  't' => 20,
  'u' => 21,
  'v' => 22,
  'w' => 23,
  'x' => 24,
  'y' => 25,
  'z' => 26,
  'A' => 27,
  'B' => 28,
  'C' => 29,
  'D' => 30,
  'E' => 31,
  'F' => 32,
  'G' => 33,
  'H' => 34,
  'I' => 35,
  'J' => 36,
  'K' => 37,
  'L' => 38,
  'M' => 39,
  'N' => 40,
  'O' => 41,
  'P' => 42,
  'Q' => 43,
  'R' => 44,
  'S' => 45,
  'T' => 46,
  'U' => 47,
  'V' => 48,
  'W' => 49,
  'X' => 50,
  'Y' => 51,
  'Z' => 52,
}
input = File.stream!("input.txt")
          |> Stream.map(&String.trim/1)
strings = input
          |> Enum.map(fn x -> String.split_at(x, div(String.length(x),2)) end)
          |> Enum.map(fn {a,b} ->
            ms1 = String.to_charlist(a)
                  |> Enum.reduce(MapSet.new(), fn x, accum -> MapSet.put(accum, x) end)
            String.to_charlist(b)
            |> Enum.reduce(MapSet.new(), fn x, accum -> MapSet.put(accum, x) end)
            |> MapSet.intersection(ms1)
            |> MapSet.to_list
          end)

IO.puts("Part 1: #{Enum.reduce(strings,0, fn x,accum -> Map.get(lookup, x)+accum end)}")

allchars = MapSet.new(Enum.to_list(?a..?z) ++ Enum.to_list(?A..?Z))
numbers = input
          |> Enum.chunk_every(3)
          |> Enum.map(fn group ->
            Enum.reduce(group, [], fn victim, accum ->
              [MapSet.new(String.to_charlist(victim)) | accum]
            end)
            |> List.flatten
            |> Enum.reduce(allchars, fn x, accum -> MapSet.intersection(x,accum) end)
            |> MapSet.to_list
          end )
IO.puts("Part 2: #{Enum.reduce(numbers, 0, fn x, accum -> Map.get(lookup, x)+accum  end)}")
