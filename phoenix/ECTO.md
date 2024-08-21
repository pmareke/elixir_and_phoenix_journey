# ECTO

- Ecto is split into 4 main components:
    - `Repo`: wrappers around the data store, they can create, update, destroy and query existing entries.
    - `Schema`: used to map external data into Elixir structs.
    - `Query`: used to retrieve information from a given repository.
    - `Changeset`: use to track and validate changes before they are applied to the data.
- Ecto to interact with SQL databases using the `ecto_sql` project.

## Repositories

- We can define a repository as follows:
    ```elixir
    defmodule Repo do
      use Ecto.Repo, otp_app: :my_app, adapter: Ecto.Adapters.Postgres
    end
    ```
- The configuration for the Repo must be in your application environment.
    ```elixir
    config :my_app, Repo,
      database: "ecto_simple",
      username: "postgres",
      password: "postgres",
      hostname: "localhost",
      # OR use a URL to connect instead
      url: "postgres://postgres:postgres@localhost/ecto_simple"
    ```
- Each repository in Ecto defines a `start_link/0` function that needs to be invoked before using the repository.
    - In general, this function is not called directly (`children` object).

## Schemas

- We can define a schema as follows:
    ```elixir
    defmodule Weather do
      use Ecto.Schema

      # weather is the DB table
      schema "weather" do
        field :city,    :string
        field :temp_lo, :integer
        field :temp_hi, :integer
        field :prcp,    :float, default: 0.0
      end
    end
    ```
- Defining a schema Ecto automatically defines a struct with the schema fields.
- After persisting to the database, it will return a new copy of the inserted object with the primary key (`id`).
- `embedded_schema/1` is used for defining schemas that are embedded in other schemas or only exist in-memory.

## Changesets

- Operations on top of schemas are done through changesets so Ecto can efficiently track changes.
- Changesets allow developers to filter, cast, and validate changes before we apply them to the data.
    ```elixir
    defmodule User do
      use Ecto.Schema

      import Ecto.Changeset

      schema "users" do
        field :name
        field :email
        field :age, :integer
      end

      def changeset(user, params \\ %{}) do
        user
        |> cast(params, [:name, :email, :age])
        |> validate_required([:name, :email])
        |> validate_format(:email, ~r/@/)
        |> validate_inclusion(:age, 18..100)
      end
    end
    ```
- The `cast` function applies the given params as changes on the data according to the set of permitted keys. 
    - It returns a changeset.
    - Any parameter that was not explicitly listed in the fields list will be ignored.
- After casting, the changeset is given to many `Ecto.Changeset.validate_*`.
    - These functions that validate only the changed fields.
- Once a changeset is built, it can be given to functions like insert and update in the repository.

## Queries

- Ecto allows you to write queries in Elixir and send them to the repository.
- We need to import the `import Ecto.Query, only:`.
- Queries are defined and extended with the `from` macro.
- In order to access params values or invoke Elixir functions, you need to use the `^` operator.
- Besides `Repo.all/1` which returns all entries and `Repo.one/1` which returns one entry or nil,
- It is possible to set a prefix for the queries. 
    - For Postgres users, this will specify the schema where the table is located.

## Associations

- Ecto supports `has_many`, `belongs_to` among others.
- Ecto module also provides conveniences for working with associations:
    - `assoc/3` returns a query with all associated data to a given struct.
    - `build_assoc/3` allows someone to build an associated struct with the proper fields.
- Ecto requires developers to specify the key `:ecto_repos` before using tasks like `ecto.create` and `ecto.migrate`.
