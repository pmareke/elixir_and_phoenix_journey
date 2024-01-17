# Elixir

- Elixir is a dynamic, functional language for building scalable and maintainable applications.

## Basic types

- Elixir has 5 basic types: `integers, floats, booleans, atoms, and strings`.
- In Elixir, the operator `/` always returns a float.
- If you want to do integer division or get the division remainder, you can invoke the `div` and `rem` functions.
- You can invoke the `round` function to get the closest integer to a given float.
- You can invoke the `trunc` function to get the integer part of a float.
- The `is_integer` funcition can be used to check if a value is an integer or not.
- Functions in Elixir are identified by both their name and their arity.
- Elixir supports true and false as booleans.
- Elixir also provides three boolean operators: `or/2`, `and/2`, and `not/1`.
- Elixir also provides the concept of `nil` to indicate the absence of a value.
- An atom is a constant whose value is its own name.
- Elixir allows you to skip the leading `:` for the atoms `false`, `true` and `nil`.
- Strings in Elixir are delimited by double quotes, and they are encoded in UTF-8.
- You can concatenate two strings with the `<>/2` operator.
- Elixir also supports string interpolation with `"#{variable}"`.
- You can print a string using the `IO.puts/1` function from the IO module.
- Strings in Elixir are represented internally by contiguous sequences of bytes known as binaries.
- You can get the actual length of the string using the `String.length/1` function.
- Elixir also provides `==`, `!=`, `<=`, `>=`, `<` and `>` as comparison operators.

## Lists and tuples

- Elixir uses square brackets to specify a list of values of any type.
- Two lists can be concatenated or subtracted using the `++/2` and `--/2` operators.
- List operators never modify the existing list.
- Elixir data structures are **immutable**.
- The head of the list can be retrieved with the `hd/1` function.
- The tail of the list can be retrieved with the `tl/1` function.
- Elixir uses curly brackets to define tuples.
- Lists are stored in memory as linked lists and Tuples, on the other hand, are stored contiguously in memory.
- Lists are used when the number of elements returned may vary and Tuples have a fixed size. 
- When counting the elements in a data structure the function is named `size` if the operation is in constant time or `length` if the operation is linear.

## Pattern matching

- The `=` operator in Elixir is called the match operator.
- A pattern match error will occur if the sides can't be matched.
- We can match on specific values `{:ok, result} = {:ok, 13}`.
- A list also supports matching on its own head and tail.

## case, cond, and if

- `case` allows us to compare a value against many patterns.
- To pattern match against an existing variable, you need to use the `^` operator.
- Clauses also allow extra conditions to be specified via guards like `when`.
- If none of the clauses match, an error is raised.
- `cond` checks different conditions and find the first one that does not evaluate to nil or false.
- Elixir also provides `if/2` and `unless/2` to check for only one condition.
- If any variable is declared or changed inside `if`, `case` the declaration and change will only be visible inside the construct.

## Anonymous functions

- TBD
