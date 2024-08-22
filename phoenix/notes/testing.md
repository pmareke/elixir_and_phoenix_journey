# Testing

- Elixir ships with a built-in testing framework called ExUnit.

## Controllers

- `use AppNameWeb.ConnCase` is build on top of `ExUnit.Case` and bring some new functionalities.
- The `test/3` macro receives three arguments: the test name, the testing context and the contents of the test.
- The `get/2` macro is used to make a GET request to the given path.

