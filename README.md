# Elixir Enum.each Blocking Issue

This repository demonstrates a potential issue when using `Enum.each` with blocking operations like `Process.sleep` within a concurrent Elixir application.

The problem arises because `Enum.each` iterates synchronously.  If a long-running operation (like `Process.sleep` in this case) is encountered, it blocks the entire process until it completes, potentially causing unexpected delays or blocking other parts of the application.

The solution involves using asynchronous operations or alternative functions like `Enum.map` with a task that uses `Task.async` to avoid the blocking issues.

**Bug:** The `bug.ex` file shows the code with `Process.sleep` leading to the blocking problem. The `bugSolution.ex` file provides a more robust solution.

**Solution:** The improved solution uses `Task.async` to run the processing concurrently and avoiding blocking behaviors.