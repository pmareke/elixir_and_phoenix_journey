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

- Anonymous functions in Elixir are delimited by the keywords ```fn` and `end`.
- A dot `.` between the variable and parentheses is required to invoke an anonymous function.
- Anonymous functions can also access variables that are in scope when the function is defined.
- We can pattern match on the arguments of anonymous functions.
- The capture syntax can also be used as a shortcut for creating functions `fun = &(&1 + 1)`.
- The `&1` represents the first argument passed into the function.

## Binaries, strings, and charlists

- In Elixir you can use a `?` in front of a character literal to reveal its code point.
- Bitstring is a fundamental data type in Elixir, denoted with the `<<>>/1` syntax.
- A binary is a bitstring where the number of bits is divisible by 8.
- A charlist is a list of integers where all the integers are valid code points.
- You can convert a charlist to a string and back by using the `to_string/1` and `to_charlist/1`.

## Keyword lists and maps

- Associative data structures are able to associate a key to a certain value.
- Keyword lists are a data-structure used to pass options to functions.
- Keyword lists are simply lists consisting of 2-item tuples where the first element (the key) is an atom and the second element can be any value.
- You can read the value of a keyword list using the brackets syntax.
- In case of duplicate keys, values added to the front are the ones fetched.
- Keyword lists are important because they have three special characteristics:
    - Keys must be atoms.
    - Keys are ordered, as specified by the developer.
    - Keys can be given more than once.
- Keyword lists are used in situations where not all keys may be present.
- In order to manipulate keyword lists, Elixir provides the `Keyword` module.
- A map is created using the `%{}` syntax.
- Compared to keyword lists, we can already see two differences:
    - Maps allow any value as a key.
    - Maps' keys do not follow any ordering.
- In contrast to keyword lists, maps are very useful with pattern matching.
- The `Map` module provides a very similar API to the `Keyword` module.
- When the keys are atoms, in particular when working with maps of predefined keys, we can also access them using the map.key syntax.
- These operations have one large benefit in that they raise if the key does not exist.
- Use keyword lists for passing optional values to functions.
- Use maps for general key-value data structures.
- Use maps when working with data that has a predefined set of keys.

## Modules and functions

- In Elixir we group several functions into modules.
- In order to create our own modules in Elixir, we use the `defmodule` macro.
- We use the `def` macro to define functions in that module.
- Elixir also supports `.exs` files for scripting.
- Function declarations also support guards and multiple clauses.
- If a function has several clauses, Elixir will try each clause until it finds one that matches.
- Function definitions in Elixir also support default arguments (`\\`).
- If a function with default values has multiple clauses, it is required to create a function head for declaring defaults.
- When a variable is not used by a function or a clause, we add a leading underscore `_`.

## Recursion

- Elixir does not provide loop constructs.
- Due to immutability, loops in Elixir are written differently from imperative languages.
- Recursion and tail call optimization are an important part of Elixir and are commonly used to create loops.
- The `Enum` module already provides many conveniences for working with lists.

## Enumerables and Streams

- Most operations we perform on collections is done with the `Enum` and `Stream` modules.
- The `Enum` module provides a huge range of functions to transform, sort, group, filter and retrieve items from enumerables.
- [Enum cheatsheet](https://hexdocs.pm/elixir/1.16/enum-cheat.html).
- Elixir also provides `Ranges`.
- For specific operations, like inserting and updating particular elements, you may need to reach for modules specific to the data type.
- All the functions in the Enum module are eager.
- The pipe operator (`|>`) takes the output from the expression on its left side and passes it as the first argument to the function call on its right side.
- Elixir provides the `Stream` module which supports lazy operations.
- Streams are lazy, composable enumerables.

## Processes

- TBD
