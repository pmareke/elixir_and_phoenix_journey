# Authentication

- The `mix phx.gen.auth` command generates a flexible, pre-built authentication system into your Phoenix app.
    - `mix phx.gen.auth Accounts User users`
- The `authentication` generators support `LiveView` or `Controller`.
- Either approach will create an `Accounts` context with an `Accounts.User` `schema` module.
- The final argument is the plural version of the schema module, which is used for generating database table names and route paths.
- Since this generator installed additional dependencies in `mix.exs`.
- We need to verify the database connection details for the development and test environments with `mix ecto.setup`.
- The `password` hashing mechanism defaults to `bcrypt` for Unix systems and `pbkdf2` for Windows systems.

## Forbidding access

- The generated code ships with an authentication module with a handful of plugs that fetch the current user, require authentication and so on.
    - A module named `AppNameWeb.UserAuth` with plugs such as:
        - `fetch_current_user`: fetches the current user information if available.
        - `require_authenticated_user`: must be invoked after fetch_current_user and requires that a current user exists and is authenticated.
        - `redirect_if_user_is_authenticated`: used for the few pages that must not be available to authenticated users.

## Confirmation

- The generated functionality ships with an account confirmation mechanism, where users have to confirm their account, typically by email.
- However, the confirmation mechanism is disabled by default.
- You can add this functionality by customizing the require_authenticated_user in the Auth module to check for the confirmed_at field.

## Tracking session

- All sessions and tokens are tracked in a separate table.

## API Authentication

- Since the authentication generator already includes a token table, we use it to store API tokens too, following the best security practices.
- Our authentication system will require two functions.
    - Create the API token (`create_user_api_token`).
    - Verify it (`fetch_user_by_api_token`).
- The `UserToken` module expects us to declare the validity of each token with the `days_for_context` method.
- When we ran `mix phx.gen.auth`, it generated a `MyAppWeb.UserAuth` module with several plugs.
- We need to create a new function called `def fetch_api_user(conn, _opts) do`
- Once we have the plug function we can add it in our router with `plug :fetch_api_user`.

