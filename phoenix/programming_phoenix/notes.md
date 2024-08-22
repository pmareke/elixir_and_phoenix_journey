# Programming Phoenix

## Chapter 2 - The Lay of the Land

- Each request comes in through an `endpoint`.
- From there, requests go into our `router` layer.
- The router directs a request into the appropriate `controller`, after passing it through a series of `pipelines`.
- A `pipeline` groups functions together to handle common `tasks`.
- The connection flows into the controller and calls common services.
    - In Phoenix, those common services are implemented with Plug.
- `Routes` in Phoenix go in `lib/hello_web/router.ex` by default.
- All controllers in Phoenix are in `lib/hello_web/controllers`.
- The `use HelloWeb, :controller` call prepares us to use the Phoenix Controller API.
- The `:` tells Phoenix to create a parameter called in our route and pass that name as a parameter to the controller. 
- In the `controllers`, the external parameters have `string keys`, while inside the `actions` they not.
- Each `plug` consumes and produces a common data structure called `Plug.Conn`.
- Think of each individual `plug` as a function that takes a `conn` and returns a slightly changed `conn`.
- Since `Phoenix` projects are `Elixir` applications, they have the same structure as other `Mix` projects.
- The `.exs` files are Elixir scripts. They’re not compiled to .beam files.
- The `.ex` files are compiled to .beam files.
- Each project has a `mix.exs` file containing basic information about the project.
- Each Mix project also has a `lib` directory.
    - Support for starting, stopping, and supervising each application is in `lib/hello/application.ex`.
- Phoenix supports a master configuration file plus an additional file for each environment you plan to run in.
- Use `MIX_ENV` to set the environment.
- The master configuration file, `config/config.exs`, initially contains information about logging, and endpoints.
- An `endpoint` is the boundary where the web server hands off the connection to our application code.
- `Endpoints` are the chain of `functions` at the beginning of each request.
- The `application` is a series of `plugs`, beginning with an `endpoint` and ending with a `controller`.
- A `pipeline` is just a bigger `plug` that takes a `conn` struct and returns one too.
- In general, the `router` is the last plug in the endpoint.

## Chapter 3 - Controllers

- A `context` in Phoenix is nothing more than a module that groups `functions` with a shared purpose.
- A `context` encapsulates all business logic for a common purpose.
- By using `contexts`, we decouple and isolate our systems into manageable, independent parts.
- A `struct` is Elixir’s main abstraction for working with structured data.
- Elixir `structs` are built on top of `maps`.
- A limitation of `maps` is that they offer protection for bad keys only at runtime, when we effectively access the key.
- If you know exactly which keys should be in a `map`, a `struct` is a better choice.
- A `view` is a module containing rendering functions that convert data into a format the end user will consume, like HTML or JSON.
- Those rendering functions can also be defined from `templates`.
- A `template` is a function on that module, compiled from a file containing a raw markup language and embedded Elixir code to process 
substitutions and loops.
- `Views` are modules responsible for rendering.
- `Templates` are web pages or fragments that allow both static markup and native code to build response pages.
- `EEx` executes Elixir code that’s within `<%= %>` tags, injecting the result into the template.
- When Phoenix renders `templates` from a `controller`, it infers the name of the `view` module.
- The `view` modules infer their template locations from the view module name.
- When we call `render` the controller first renders the layout view, which then renders the actual template.
- `Layouts` are regular views with templates.
- When you call `render` in your controller, you’re actually rendering with the `:layout` option set by default.

## Chapter 4 - Ecto and Changesets

- `Ecto` is the Elixir framework for persisting data.
- `Ecto` is a wrapper that’s primarily intended for relational databases.
- `Ecto` also has a feature called changesets that holds all changes you want to perform on the database.
- `Ecto` lets you specify a struct that ties individual fields to the fields in database tables through a DSL.
- The `schema` and `field` macros let us specify both the underlying database table and the Elixir struct at the same time.
- Each `field` corresponds to both a field in the database and a field in a `struct`.
- By default, Ecto defines the primary key called `:id` automatically.
- To make the database reflect the structure of our application `Ecto` uses migrations.
- A `migration` changes a database to match the structure our application needs.
- `mix ecto.gen.migration` generates a new migration.
- The Ecto.Migration API provides several functions to create, remove, and change database tables, fields, and indexes.
- The `ecto.migrate` task will migrate the database for your current environment.
- There are several methods in `Ecto` to access our data:
    - `Repo.get(%{})`.
    - `Repo.get_by(%{]})`.
    - `Repo.all(%{})`.
    - `Repo.insert(%{})`.
- `Changesets` let `Ecto` manage record changes, cast parameters, and perform validations.
- The `cast` function accepts a list of fields allowed to be cast.
- The `validate_required` function returns an `Ecto.Changeset`.
- The `changeset` lets `Ecto` decouple update policy from the schema.
- `resources` is a shorthand implementation for a common set of actions that define `create`, `read`, `update`, and `delete` operations.

## Chapter 5 - Authenticating Users

- The `Ecto.Changeset.cast` function converts a raw `map` of user input to a `changeset`.
- Use one changeset per use case.
- Use a separate changeset to manage more sensitive data such as credential changes.
- `Virtual` schema fields in Ecto exist only in the struct, not the database.
-  There are two kinds of `plugs`:
    - `function`: is a single function.
    - `module`: is a module that provides two functions with some configuration details.
- You specify a module plug by providing the module name.
- To satisfy the Plug specification, a module plug must have two functions, named `init` and `call`.
- A `plug` transforms a connection.
- The main work of a module `plug` happens in `call` method.
- Plug uses the result of `init` as the second argument to `call`. 
- Phoenix calls `init` at runtime, but in production mode, `init` is called only once, at compile time.
- The `init` method the perfect place to validate and transform options without slowing down every request.
- For both module and function plugs, the request interface is the same. `conn`, the first argument.
- `conn` is only a `Plug.Conn` struct.
- The most important field of the `Plug.Conn` struct are:
    - `host`.
    - `method`.
    - `path_info`.
    - `req_headers`.
    - `scheme`.
    - `cookies`.
    - `params`.
    - `assigns`.
    - `halted`.
    - `resp_body`.
    - `resp_cookies`.
    - `resp_header`.
    - `status`.
    - `adapter`.
    - `private`.
- Initially, a `conn` comes in almost blank and is filled out progressively by different plugs in the pipeline.
- A `function` plug is any function that receives two arguments, the `connection` and a set of `options`, and returns a connection.
- Plug pipelines explicitly check for `halted`: true between every plug invocation.

## Chapter 6 - Generators and Relationships
