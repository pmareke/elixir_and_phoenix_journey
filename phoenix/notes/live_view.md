# Live View

- Phoenix `LiveView` enables rich, real-time user experiences with server-rendered HTML.
- `LiveViews` are processes that receive `events`, update their `state`, and render updates to a page as diffs.
- Events in `LiveView` are regular messages which may cause changes to the state.
    - Once the state changes, the `LiveView` will re-render the relevant parts of its HTML template and push it to the browser.
- `LiveView` `state` is nothing more than functional and immutable Elixir data structures.
- `LiveView` is included by default in `Phoenix` applications.
- The `LiveView` files lives under the `lib/my_app_web/live` directory.
- `live_render` renders a live view from a Plug request and sends an HTML response from within a controller.
    - It recieves the `conn` or the `socket`, the `module` and the `assigns`.
- There are three main `callbacks` in a LiveView module:
    - `use MyAppWeb, :live_view`.
    - `render/1`:
        - Is used to render the initial HTML.
        - Receives the socket `assigns`.
        - The data used on rendering comes from the `mount` callback.
    - `mount/2`:
        - Is invoked when the LiveView `starts`.
        - Is used to initialize the LiveView `state`.
        - Receives three arguments: the request `parameters`, the `session`, and the `socket`.
        - The `socket` is where the state lives, including `assigns`.
        - LiveView APIs often receive the `socket` and return an `updated socket`.
    - `handle_event/3` :
        - Is used to `handle` events.
        - Receives the `event`, the `socket`, the `params` and the `socket`.
        - There are several `phx-` events that are handled by `LiveView`.
        - This `callback` updates the socket and returns `{:noreply, socket}` with the updated `socket`.
- In the `router` file, the LiveView is mounted using the `live` macro.
- `Phoenix` supports DOM element bindings for client-server interaction.
    - `phx-click`: Sends a click event to the server.
    - `phx-change`: Sends a change event to the server.
    - `phx-submit`: Sends a submit event to the server.
- All `LiveView bindings` are handled with the `handle_event/3` callback.
- `LiveView` has built-in support for `forms`.
- `LiveView` provides functionality to allow page `navigation`.
    - Either `patch` the current LiveView, `updating` its `URL`, or `navigate` to a new LiveView.
- `LiveView` supports two extension mechanisms:
    - `Function` components, provided by HEEx templates.
    - `Stateful` components.

## Server-Side Rendering

- All of the data in a `LiveView` is stored in the struct called `Phoenix.LiveView.Socket`.
- Our own data is stored under the `assigns` key of said struct.
    - The values can be accessed in the `LiveView` as `socket.assigns.name`.
    - They are accessed inside `HEEx` templates as `@name`.
- Phoenix template language is called `HEEx`.
    - Those templates are either files with the `.heex` extension.
    - They are created directly in source files via the `~H` sigil.
- `LiveView` has to disable change tracking whenever variables are used in the template.
- Avoid accessing the `assigns` variable directly inside templates and instead use `@` for accessing specific keys.
- `{:noreply, put_flash(socket, :error, "error_message")}` in case of error.
- The application is made of two `layouts`:
    - `root.html.heex`:
        - This layout typically contains the `<html>` definition alongside the `head` and `body` tags.
        - Is a layout used by both LiveView and regular views.
        - Is rendered only on the initial request and therefore it has access to the `@conn` assign.
    - `app.html.heex`:
        - Is the `default` application layout which is rendered on both regular HTTP requests and LiveViews.
        - It defaults to `app.html.heex`.
- All layouts must call `<%= @inner_content %>` to inject the content rendered by the layout.
- There are two ways to trigger live navigation:
    - From the client this is done by passing either `patch={url}` or `navigate={url}` to the `link/1` component.
    - From the server this is done by `push_patch/2` or `push_navigate/2`.
- The `navigate` operations must be used when you want to dismount the current LiveView and mount a new one.
- `<.link href={...}>` perform full page reloads.
- `<.link navigate={...}>` mount a new LiveView while keeping the current layout.
- `<.link patch={...}>` updates the current LiveView and sends only the minimal diff.
- The `handle_params/3` callback is invoked after `mount/3` and before the initial render.

## Client-Side Rendering

- Phoenix supports DOM element bindings for client-server interaction.
- The `phx-click` binding is used to send click events to the server.
- The `phx-debounce` binding is used to debounce the event.
- To handle form changes and submissions, use the `phx-change` and `phx-submit` events.
- To handle real-time form validation and saving, your form would use both `phx-change` and `phx-submit` bindings.
- The `phx-feedback-for` annotation specifies the name of the input it belongs to.
- To reset a `LiveView` form, you can use the standard `type="reset"` on a form button or input.

## Telemetry

- `LiveView` currently exposes the following telemetry `events`:
    - `[:phoenix, :live_view, :mount, :start/stop/exception]`.
    - `[:phoenix, :live_view, :handle_params, :start/stop/exception]`.
    - `[:phoenix, :live_view, :handle_event, :start/stop/exception]`.
    - `[:phoenix, :live_view, :render, :start/stop/exception]`.
    - `[:phoenix, :live_view, :update, :start/stop/exception]`.
    - `[:phoenix, :live_component, :handle_event, :start/stop/exception]`.

## Phoenix.Component

- Define reusable function components with `HEEx` templates.
- A `function` component is any function that receives an `assigns` map and `returns` a rendered struct built with the `~H` sigil.
    -  ```elixir
        defmodule MyAppWeb.Component do
            use Phoenix.Component

            def button(assigns) do
                ~H"""
                <button>Click me</button>
                """
            end
        end
        ```
- Phoenix.Component provides the `attr/3` macro to declare what attributes the proceeding function component.
- Function components can accept blocks of HEEx content, referred to as slots.
    - Use `<%= render_slot(@inner_block) %>`  to declare slots for function components.
- The `embed_templates/1` macro can be used to embed `.html.heex` files as function components.
