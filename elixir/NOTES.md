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
- Elixir supports `true` and `false` as booleans.
- Elixir also provides three boolean operators: `or/2`, `and/2`, and `not/1`.
- Elixir also provides the concept of `nil` to indicate the absence of a value.
- An atom is a constant whose value is its own name.
- Elixir allows you to skip the leading `:` for the atoms `false`, `true` and `nil`.
- `Strings` in Elixir are delimited by double quotes, and they are encoded in UTF-8.
- You can concatenate two strings with the `<>/2` operator.
- Elixir also supports string interpolation with `"#{variable}"`.
- You can print a string using the `IO.puts/1` function from the IO module.
- Strings in Elixir are represented internally by contiguous sequences of bytes known as binaries.
- You can get the actual length of the string using the `String.length/1` function.
- Elixir also provides `==`, `!=`, `<=`, `>=`, `<` and `>` as comparison operators.

## Lists and tuples

- Elixir uses square brackets to specify a list of values of any type.
- Two lists can be concatenated or subtracted using the `++/2` and `--/2` operators.
- `List` operators never modify the existing list.
- Elixir data structures are **immutable**.
- The `head` of the list can be retrieved with the `hd/1` function.
- The `tail` of the list can be retrieved with the `tl/1` function.
- Elixir uses curly brackets to define tuples.
- `Lists` are stored in memory as linked lists and `Tuples`, on the other hand, are stored contiguously in memory.
- `Lists` are used when the number of elements returned may vary and `Tuples` have a fixed size. 
- When counting the elements in a data structure the function is named `size` if the operation is in constant time or `length` if 
the operation is linear.

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

- Anonymous functions in Elixir are delimited by the keywords `fn` and `end`.
- A dot `.` between the variable and parentheses is required to invoke an anonymous function.
- Anonymous functions can also access variables that are in scope when the function is defined.
- We can pattern match on the arguments of anonymous functions.
- The capture syntax can also be used as a shortcut for creating functions `fun = &(&1 + 1)`.
- The `&1` represents the first argument passed into the function.

## Binaries, strings, and charlists

- In Elixir you can use a `?` in front of a character literal to reveal its code point.
- `Bitstring` is a fundamental data type in Elixir, denoted with the `<<>>/1` syntax.
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
    - `Maps` allow any value as a key.
    - `Maps`' keys do not follow any ordering.
- In contrast to keyword lists, maps are very useful with pattern matching.
- The `Map` module provides a very similar API to the `Keyword` module.
- When the keys are atoms, in particular when working with maps of predefined keys, we can also access them using the `map.key` syntax.
- These operations have one large benefit in that they raise if the key does not exist.
- Use keyword lists for passing optional arguments to functions.
- Use maps for general key-value data structures.
- Use maps when working with data that has a predefined set of keys.

## Modules and functions

- In Elixir we group several functions into modules.
- In order to create our own modules in Elixir, we use the `defmodule` macro.
- We use the `def` macro to define functions in that module.
- We use the `defp` macro to define private functions in that module.
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
- The pipe operator (`|>`) takes the output from the expression on its left side and passes it as the first argument to the function call 
on its right side.
- Elixir provides the `Stream` module which supports lazy operations.
- `Streams` are lazy, composable enumerables.

## Processes

- `Processes` are isolated from each other, run concurrent to one another and communicate via message passing.
- `Processes` in Elixir are extremely lightweight in terms of memory and CPU.
- The basic mechanism for spawning new processes is the auto-imported `spawn/1` function.
- The spawned process will execute the given function and exit after the function is done.
- We can retrieve the PID of the current process by calling `self/0`.
- We can send messages to a process with `send/2` and receive them with `receive/1`.
- When a message is sent to a process, the message is stored in the process mailbox.
- The process that sends the message does not block.
- The `inspect/1` function is used to convert a data structure's internal representation into a string.
- `Processes` and links play an important role when building fault-tolerant systems.
- Elixir processes are isolated and don't share anything by default.
- `Links` allow processes to establish a relationship in case of failure.
- To propagate one error from one process to another use `spawn_link`.
- `spawn` and `spawn_link` are the basic primitives for creating processes in Elixir.
- `Tasks` build on top of the spawn functions to provide better error reports and introspection.
    - `Task.start/1` and `Task.start_link/1` which return `{:ok, pid}` rather than just the PID.
    - It is also possible to register the pid, giving it a name.
- Elixir provides `Agents` are simple abstractions around `state`.

## IO and the file system

- The `IO` module is the main mechanism in Elixir for reading and writing to standard input/output.
- By default, functions in the IO module read from the standard input and write to the standard output.
- The `File` module contains functions that allow us to open files as IO devices.
- The `File` functions version with `!` returns the contents of the file instead of a tuple.
- The `IO` module actually works with processes.

## alias, require, and import

- `alias` allows you to set up aliases for any given module name.
- `Aliases` are frequently used to define shortcuts.
- Elixir provides `macros` as a mechanism for meta-programming.
- `require` makes sure that the required module is loaded before the calling module.
- We use `import` whenever we want to access functions or macros from other modules without using the fully-qualified name.
- We can only import public functions, as private functions are never accessible externally.
- The `use` macro is frequently used as an extension point.
- `use` requires the given module and then calls the `__using__/1` callback on it allowing the module to inject some code into the current context.
- Since `use` allows any code to run, we can't really know the side-effects of using a module without reading its documentation.
- It is possible to `alias`, `import`, `require`, or `use` multiple modules at once.

## Module attributes

- Module attributes in Elixir serve three purposes:
    - They serve to annotate the module, often with information to be used by the user or the VM.
    - They work as constants.
    - They work as a temporary module storage to be used during compilation.
- `@moduledoc` provides documentation for the current module.
- `@doc` provides documentation for the function or macro that follows the attribute.
- `@spec` provides a typespec for the function that follows the attribute.
- `@behaviour` (notice the British spelling) used for specifying an OTP or user-defined behaviour.
- Elixir treats documentation as first-class and provides many functions to access documentation.
- Constants are defined adding the `@` to the variable name.

## Structs

- `Structs` are extensions built on top of maps that provide compile-time checks and default values.
- To define a struct, the `defstruct/1` construct is used.
- `Structs` are bare `Maps` underneath.
- If you don't specify a default key value when defining a struct, `nil` will be assumed.
- `Structs` share the same syntax for accessing and updating fields as maps of fixed keys using the update syntax `(|)`.
- `Structs` are simply maps with a "special" field named __struct__ that holds the name of the struct.
- `Structs` do not inherit any of the protocols that maps do.

## Protocols

- `Protocols` are a mechanism to achieve polymorphism in Elixir where you want the behavior to vary depending on the data type.
- `Protocols` allow us to extend the original behavior for as many data types as we need.
- We define the protocol using `defprotocol`.
- We implement the protocol for a data type using `defimpl , for`.
- The power of Elixir's extensibility comes when protocols and structs are used together.
- Elixir allows us to derive a protocol implementation based on the `Any` implementation.

## Comprehensions

- `Comprehensions` are syntactic sugar for looping over an Enumerable, often filtering out some results and mapping values into another list.
- A `comprehension` is made of three parts: generators, filters, and collectables.
    - In `for n <- [1, 2, 3, 4], n > 1, do: n * n` 
    - `n <- [1, 2, 3, 4]` is the generator.
    - `n > 1` is the filter.
    - `do: n * n` is the collectable.
-  The result of a `comprehension` can be inserted into different data structures by passing the `:into`.

## Sigils

- Elixir provides double-quoted strings as well as a concept called charlists.
- `Sigils` provide the foundation for extending the language with custom textual representations.
- `Sigils` start with the tilde `~` character.
- The most common `sigil` in Elixir is `~r`, which is used to create regular expressions.
- The `~w` sigil is used to generate lists of words.
- The `~s` sigil is used to generate strings.
- The `~c` sigil is used to generate charlists.
- The `~D` sigil is used to generate dates.
- The `~T` sigil is used to generate times.

## try, catch, and rescue

- `Errors` (or `exceptions`) are used when exceptional things happen in the code.
- `Errors` are raised using the `raise/1` function.
- Other errors can be raised with `raise/2` passing the error name.
- `Errors` can be caught using the `try/catch` construct.
- A process can also die by explicitly sending an `exit` signal.
- `exit` can also be "caught" using `try/catch`.
- The `try/after` construct allows to ensure that a resource is cleaned up after some action that could potentially raise an error.

## Debugging

- `IO.inspect/2` is a useful function to print information while debugging.

## Meta-programming


### Quote and unquote

- The building block of an Elixir program is a tuple with three elements.
    - `quote do: sum(1, 2, 3)` -> `{:sum, [], [1, 2, 3]}`
- You can get the representation of any expression by using the `quote/2` macro.
    - The first element is the function name.
    - The second is a keyword list containing metadata.
    - The third is the arguments list.
- `Quoting` is about retrieving the inner representation of some particular chunk of code.
- `Unquoting` is about injecting a value into a quoted expression.

### Macros

- Write macros responsibly.
- `Macros` in Elixir are defined via `defmacro/2`.

## Domain-Specific Languages (DSLs)

- DSLs are languages tailored to a specific application domain.
- The `__using__/1` initializes the module.
- Callbacks such as `@before_compile (__before_compile__)` allow us to inject code into the module when its definition is complete.

## Patterns and guards

- Elixir provides pattern matching.
- Patterns in Elixir are made of variables, literals, and data structure specific syntax.
    - The match operator `(=)` performs pattern matching.
    - Patterns are not bidirectional.
- Elixir supports rebinding `(^)` in case you don't want the value of a variable to change.
- `Tuples` may appear in patterns using the curly brackets syntax `({})`.
- `Lists` may appear in patterns using the square brackets syntax `([])`.
- `Lists` also allow matching on non-empty lists by using the `[head | tail]` notation.
- `Maps` may appear in patterns using the `%{}` syntax.
- `Structs` may appear in patterns using the `%ModuleName{}` syntax.
- `Guards` are a way to augment pattern matching with more complex checks.
    - `Guards` are defined using the `when` keyword.
