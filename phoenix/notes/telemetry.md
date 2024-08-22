# [Telemetry](https://hexdocs.pm/telemetry/readme.html)

- Telemetry is a lightweight library for dynamic dispatching of events.
- Any Erlang or Elixir library can use telemetry to emit events.
- A Telemetry event is made up of the following:
    - `name`: A string or a list of atoms that uniquely identifies the event.
    - `measurements`: A map of atom keys and numeric values.
    - `metadata`: A map of key-value pairs that can be used for tagging metrics.
- In a nutshell, you register a custom module and function to be invoked for certain events.
- `:telemetry.execute/3` is used to dispatch an event (an atom) with some measurements and metadata (maps).
    - `execute(EventName, Measurements)`.
    - `execute(EventName, Measurements, Metadata)`.
- `:telemetry.attach/4` is used to attach a handler to an event.
    - `attach(Handler, EventName, Module, Function)`.
- `:telemetry.attach_many/4` is used to attach to multiple events using the same handler.
- The handler is a function that receives the event name, measurements, and metadata.
    - `def handle_event(event, measurements, metadata, _config), do:`
- In order to provide uniform events that capture the start and end of discrete events, it is recommended that you use the `telemetry:span/3` call.


## [Telemetry in a Phoenix app](https://hexdocs.pm/phoenix/telemetry.html)

- The `:telemetry` library allows you to emit events at various stages of an application's lifecycle.
- Since v1.5, new Phoenix applications are generated with a Telemetry supervisor.
- The list of Phoenix events is availabe [here](https://hexdocs.pm/phoenix/Phoenix.Logger.html).
