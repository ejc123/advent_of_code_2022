# Part 1
input = File.stream!("input.txt")
         |> Stream.map(fn x ->
           String.trim(x) |> String.split(",")
         end)
streams = input
        |> Stream.map(fn a ->
          Enum.map(a, fn x ->
          [a1,a2] = String.split(x,"-")
          MapSet.new(Range.new(String.to_integer(a1),String.to_integer(a2)))
          end)
          |> List.to_tuple
        end)
output = streams
        |> Stream.filter(fn {f,s} -> u = MapSet.union(f,s) |> MapSet.size(); !(u > MapSet.size(f) && u > MapSet.size(s)) end)
        |> Enum.count()

IO.puts("Part 1 #{output}")
# Part 2
streams = input
        |> Stream.map(fn a ->
          Enum.map(a, fn x ->
          [a1,a2] = String.split(x,"-")
          Range.new(String.to_integer(a1),String.to_integer(a2))
          end)
          |> List.to_tuple
        end)
output = streams
         |> Stream.filter(fn {a,b} -> !Range.disjoint?(a,b) end)
        |> Enum.count()
IO.puts("Part 2 #{output}")

