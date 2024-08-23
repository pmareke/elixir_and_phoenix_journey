# JSON and APIs

## The JSON API

- Phoenix has generators to scaffold APIs.
    - `mix phx.gen.json CONTEXT RESOURCE RESOURCES FIELD:TYPE`.
- Files in `lib/app_name_web` responsible for effectively rendering JSON.
    - Under `controllers` folder:
        - `RESOURCE_controller.ex`.
        - `RESOURCE_json.ex`.
        - `changeset_json.ex`.
        - `fallback_controller.ex`.
- Files in `lib/app_name` responsible for defining our context and logic to persist links to the database.
    - `CONTEXT.ex`.
- Files in `priv/repo/migrations` responsible for updating our database.
- Files in `test` to test our controllers and contexts.

## Rendering JSON

- There is not any different from how Phoenix renders `HTML` templates.
- Call `render/3` passing the `connection`, the `template` and the `data`.
- Phoenix typically uses one `view` per rendering `format`.
- When rendering `HTML`, we would use `ResourceHTML`.
- When rendering `JSON`, we would use `ResourceJSON`.
    - That live under `lib/app_name_web/controllers/`.
- The `JSON` view converts our complex `data` into simple `Elixir` data-structures.
- Phoenix uses the `Jason` library to encode `JSON` and send the response to the client.

## Action Fallingback

- Action fallback allows us to centralize error handling code in plugs.
- They are called when a controller action fails to return a %Plug.Conn{} struct.
- These plugs receive both the conn which was originally passed to the controller action along with the return value of the action.
- We can define a module plug which knows how to handle these error cases specifically.
- Controllers are module plugs.
- We can define a `call/2` function in our controller to handle the error cases.
- Use pattern matching to handle different types of errors.
    - `def call(conn, {:error, :not_found}) do`
    - `def call(conn, {:error, :unprocessable_entity}) do`
    - `def call(conn, {:error, :unauthorized}) do`
    - `def call(conn, {:error, %Ecto.Changeset{} = changeset}) do`
- We can reference our new controller/plug as the `action_fallback`.

## API-only Applications

- Phoenix has several options when invoking `mix phx.new`.
- These flags start with `--no-*`, like `--no-html` or `--no-assets`.
- It's possible to have a backend that supports simultaneously the REST API and a Web App 
