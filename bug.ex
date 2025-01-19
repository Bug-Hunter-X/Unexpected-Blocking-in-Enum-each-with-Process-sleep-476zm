```elixir
list = [1, 2, 3, 4, 5]

Enum.each(list, fn x -> 
  if x == 3 do
    Process.sleep(1000) # Simulate some work
  end
  IO.puts(x)
end)
```
This code might look harmless, but it can lead to unexpected behavior in a concurrent environment.  The `Process.sleep` call pauses execution within the `Enum.each` loop. If this code were running within a task that is part of a larger system, the pause introduced by `Process.sleep` may block further processing until the task completes and the sleep finishes. 