```elixir
list = [1, 2, 3, 4, 5]

Enum.map(list, fn x ->
  Task.async(fn ->
    if x == 3 do
      Process.sleep(1000) # Simulate some work
    end
    IO.puts(x)
    x
  end)
end) |> Enum.each(fn task ->
  Task.await(task)
end)
```
This revised code uses `Task.async` to run each iteration concurrently.  The results are collected and awaited using `Task.await` within an `Enum.each` which processes the results ensuring they complete. This prevents blocking and allows the application to remain responsive.