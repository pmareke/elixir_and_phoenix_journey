# [Phoenix](https://www.phoenixframework.org/)

## Up and Running

- Run `mix phx.new` from any directory in order to bootstrap our Phoenix application.
- Run `mix phx.server` to start the Phoenix server.
- By default, Phoenix accepts requests on port 4000.
- To stop it, we hit `ctrl-c` twice.

## Packages Glossary

- The main packages are:
    - `Ecto`: a language integrated query and database wrapper
    - `Phoenix`: the Phoenix web framework (these docs)
    - `Phoenix LiveView`: build rich, real-time user experiences with server-rendered HTML. The LiveView project also defines Phoenix.Component and the HEEx template engine, used for rendering HTML content in both regular and real-time applications
    - `Plug`: specification and conveniences for building composable modules web applications. This is the package responsible for the connection abstraction and the regular request- response life-cycle
    - `ExUnit`: Elixir's built-in test framework
    - `Gettext`: internationalization and localization through gettext
    - `Swoosh`: a library for composing, delivering and testing emails, also used by mix phx.gen.auth

## Directory structure

- When we use `mix phx.new` to generate a new Phoenix application, it builds a top-level directory structure like this:
    - `_build`: contains the compilation artifacts.
    - `assets`: contains the front-end assets.
    - `config`: contains the configuration files.
        - The `config/config.exs` file is the entry point for your configuration and it imports environment specific configuration.
        - The `config/dev.exs` file is used for development environment configuration.
        - The `config/test.exs` file is used for test environment configuration
        - The `config/prod.exs` file is used for production environment configuration.
        - The `config/runtime.exs` s the best place to read secrets and other dynamic configuration.
    - `deps`: a directory with all of our Mix dependencies.
    - `lib`: a directory that holds your application source code.
        - This directory is broken into two subdirectories, `lib/app_name` and `lib/app_name_web`.
        - The `lib/app_name` directory will be responsible to host all of your business logic and business domain.
            - It holds both the `Model` from `MVC`.
        - The `lib/app_name_web` directory is responsible for exposing your business domain to the world, in this case, through a web application.
            - It holds both the `View` and `Controller` from `MVC`.
    - `priv`: a directory that keeps all resources that are necessary in production but are not directly part of your source code.
        - You typically keep database scripts, translation files, images, etc.
    - `test`: contains the test code.

### The `lib/app_name` directory

- It hosts all of your business domain.
- It contains, by default, 3 files:
    - `application.ex`:
        - It defines an Elixir application named `AppName.Application`.
        - Phoenix applications are simply Elixir applications.
        - The `AppName.Application` module defines which services are part of our application using the `children` list.
        - These services are started in the order they are defined.
        - They are stopped in the reverse order.
        - By default it starts a database repository, a PubSub system and the application endpoint.
    - `mailer.ex`: defines the main interface to deliver e-mails.
    - `repo.ex`: defines a `AppName.Repo` module which is our main interface to the database.

### The `lib/app_name_web` directory

- `controllers`: contains the controller modules.
- `components`: contains the LiveView components.
- `endpoint.ex`: is the entry-point for HTTP requests.
- `gettext.ex`: provides internationalization through Gettext.
- `router.ex`: defines the rules to dispatch requests to controllers.
- `telemetry.ex`: defines the supervisor responsible for managing the telemetry processes.

## Request life-cycle

- The router maps unique HTTP verb/path pairs to controller/action pairs which will handle them.
- Controllers in Phoenix are simply Elixir modules.
- Actions are functions that are defined within these controllers.
- All this routes are defined in the `router.ex` file.
- All controller actions take two arguments:
    - `conn`: the connection struct.
    - `params`: a map containing the request parameters.
- The `render` function tells Phoenix to render the given template.
- By default, Phoenix views are named after the controller.
    - `AppNameWeb.AppNameController`.
    - `AppNameWeb.AppNameView`.
- Phoenix views act as the presentation layer.
- Inside the `~H` sigil we use a templating language called HEEX.
- `embed_templates` is a macro that allows us to embed templates under a given path in our views.
- A template file has the following structure: `NAME.FORMAT.TEMPLATING_LANGUAGE`.
- Template files are compiled into the module as function components.
- All HTTP requests start in our application endpoint.
- The endpoint has many calls to `plug`.
- Plug is a library and a specification for stitching web applications together.
- Each plug defines a slice of request processing.
- The endpoint contains the common and initial path that all requests go through.
- The router is responsible for dispatching verb/path to controllers.
- The job of the controller is to retrieve request information, talk to your business domain, and prepare data for the presentation layer.
- The view handles the structured data from the controller and converts it to a presentation to be shown to users.
- The values we passed to the view from the controller are collectively called our `assigns`.

## Plug

- Plug lives at the heart of Phoenix's HTTP layer.
- Plug is a specification for composable modules in between web applications.
- The Plug specification comes in two flavors: function plugs and module plugs.
    - Function plugs needs:
        - Accept a connection struct (`%Plug.Conn{}`) as its first argument, and connection options as its second one;
        - Return a connection struct.
    - Function plugs are plugged by passing the function name as an atom.
    - Module plugs are another type of plug that let us define a connection transformation in a module.
    - The module only needs to implement two functions:
        - `init/1` which initializes any arguments or options to be passed to `call/2`.
        - `call/2` which carries out the connection transformation.
- The endpoint, router, and controllers in Phoenix accept plugs.
- Endpoints organize all the plugs common to every request.
- The default endpoint plugs:
    - `Plug.Static` - serves static assets.
    - `Phoenix.LiveDashboar` .RequestLogger - sets up the Request Logger for Phoenix LiveDashboard.
    - `Plug.RequestId` - generates a unique request ID for each request.
    - `Plug.Telemetry` - adds instrumentation points so Phoenix.
    - `Plug.Parsers` - parses the request body.
    - `Plug.MethodOverride` - converts the request method to PUT, PATCH or DELETE for POST requests with a valid _method parameter.
    - `Plug.Head` - converts HEAD requests to GET requests.
    - `Plug.Session` - a plug that sets up session management.
- Routes are defined inside scopes and scopes may pipe through multiple pipelines.
- Controller plugs provide a feature that allows us to execute plugs only within certain actions.

## Routing

- Routers are the main hubs of Phoenix applications.
- They match HTTP requests to controller actions.
- Both the router and controller module names will be prefixed with the name you gave your application suffixed with Web.
- `get` is a Phoenix macro that corresponds to the HTTP verb `GET`.
- Phoenix provides an excellent tool for investigating routes in an application: `mix phx.routes`.
- The `resources` macro is a powerful tool for defining RESTful routes.
- If we don't need all these routes, we can be selective using the `:only` and `:except` options to filter specific actions.
- Phoenix includes `Phoenix.VerifiedRoutes` module which provides compile-time checks of router paths against your router by using the `~p` sigil.
- Using `~p` for route paths ensures our application paths and URLs stay up to date with the router definitions.
- It is also possible to nest resources in a Phoenix router.
- Scopes are a way to group routes under a common path prefix and scoped set of plugs.
- Pipelines are a series of plugs that can be attached to specific scopes.
- Phoenix defines two pipelines by default, `:browser` and `:api`.
    - The `:browser` pipeline prepares for routes which render requests for a browser.
    - The `:api` pipeline prepares for routes which produce data for an API.
- Phoenix allows us to create our own custom pipelines anywhere in the router.
- The `Phoenix.Router.forward/4` macro can be used to send all requests that start with a particular path to a particular plug.

## Controllers

- Phoenix controllers act as intermediary modules.
- Their functions, called actions, are invoked from the router.
- Controller actions are just functions.
- The only requirement we must fulfill is that the action name matches a route defined in the router.
    - `index`: renders a list of all items of the given resource type
    - `show`: renders an individual item by ID.
    - `new`: renders a form for creating a new item.
    - `create`: receives parameters for one new item and saves it in a data store.
    - `edit`: retrieves an individual item by ID and displays it in a form for editing.
    - `update`: receives parameters for one edited item and saves the item to a data store.
    - `delete`: receives an ID for an item to be deleted and deletes it from a data store.
- Each of these actions takes two parameters:
    - The first parameter is always the `conn` struct.
    - The second parameter is `params` map.
- It is a good practice to pattern match against parameters in the function signature.
- Controllers can render content in several ways:
    - The simplest is to render some plain text using the `text/2`.
    - A step beyond this is rendering pure JSON with the `json/2` function.
    - Phoenix includes the `render/3` function for HTML.
- Passing more than one value to our template is as simple as connecting `assign/3` functions together.
- The function `send_resp/3` allows to send a response with a custom status code and headers.
- The function `put_resp_content_type/2` allows to set the content type of the response.
- The function `put_status/2` allows to set the status code of the response.
- The function `redirect/2` allows to redirect the user to a different URL.
- The function `put_flash/3` allows to set a flash message.
- Phoenix has two views called `ErrorHTML` and `ErrorJSON` to handle errors.
