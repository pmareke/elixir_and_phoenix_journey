# [Oban](https://hexdocs.pm/oban/Oban.html)

- Oban is a robust job processing library which uses PostgreSQL or SQLite3 for persistence.

## Queues

- Queues are specified as a keyword list where the key is the name of the queue and the value is the maximum number of concurrent jobs.
    ```elixir
    config :my_app, Oban,
      queues: [default: 10, mailers: 20, events: 50, media: 5],
      repo: MyApp.Repo
    ```

## Workers

- Worker modules do the work of processing a job.
- At a minimum they must define a `perform/1` function, which is called with an `%Oban.Job{}` struct.
    ```elixir
    defmodule MyApp.Business do
      use Oban.Worker, queue: :events

      @impl Oban.Worker
      def perform(%Oban.Job{args = args}) do
        ...
    ```
- The `use` macro also accepts options to customize `max_attempts`, `priority`, `tags`, `unique`, and `replace` options.
- Successful jobs should return `:ok` or an `{:ok, value}` tuple.
- Jobs are simply Ecto structs and are enqueued by inserting them into the database.
- Jobs may be scheduled down to the second any time in the future.

## Telemetry

- Oban emits the following telemetry events for each job:
    - `[:oban, :job, :start]`: emitted when a job starts.
    - `[:oban, :job, :stop]`: emitted when a job stops.
    - `[:oban, :job, :exception]`: emitted when a job raises an exception.

## Testing

- The most convenient way to use Oban.Testing is to use the module.
    - `use Oban.Testing, repo: MyApp.Repo`.
- After the test helpers are imported, you can make assertions about enqueued.

