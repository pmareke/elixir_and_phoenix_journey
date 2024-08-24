# Testing

- Elixir ships with a built-in testing framework called ExUnit.
- `mix test` runs all the tests in the `test` directory.

## Understanding test modules

- `use AppNameWeb.ConnCase` is build on top of `ExUnit.Case` and bring some new functionalities.
- The `test/3` macro receives three arguments: the test name, the testing context and the contents of the test.
- The `get/2` macro is used to make a GET request to the given path.
    - There are another macros like `post/3`, `put/3`, `delete/3`, etc.
- The `assert` macro is used to make assertions.

## The ConnCase module

- There is a file located at `test/support/conn_case.ex` that contains the `ConnCase` module.
- `use ExUnit.CaseTemplate` is a `ExUnit` feature that allows developers to replace the built-in use `ExUnit.Case`.
- Several componentes are injected with the `using` callback:
    - The app endpoint.
    - The verified routes to be able to use the `~p` sigil.
    - `Plug.Conn` so all of the connection helpers available in controllers are also available in tests.
    - `Phoenix.ConnTest`.
    - `AppNameWeb.ConnCase`.
    - A `setup` callback that is executed before each test and which injects the `conn`.

## View tests

- Under the `test/APP_NAME_web/controllers` folder.
- The files are named as `MODULE_html_test.exs`.
- They assert the rendered html.
- `async: true` means that the test case will be run in parallel with other test cases.
- `import Phoenix.Template` brings `render_to_string/4` for testing custom views.

```elixir
defmodule HelloWeb.ErrorHTMLTest do
  use HelloWeb.ConnCase, async: true

  # Bring render_to_string/4 for testing custom views
  import Phoenix.Template

  test "renders 404.html" do
    assert render_to_string(HelloWeb.ErrorHTML, "404", "html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(HelloWeb.ErrorHTML, "500", "html", []) == "Internal Server Error"
  end
end
```

## Running tests using tags

- `ExUnit` allows us to `tag` our tests individually or for the whole module.
- `@moduletag` is used to tag the whole module.
- `@tag` is used to tag the individual tests.
- `mix test --only TAG` runs the tests with the given tag.
- `mix test --exclude TAG` runs the tests without the given tag.
- We can configure `ExUnit` to exclude tags by default.
- The default `ExUnit` configuration is done in the `test/test_helper.exs` file
    - `ExUnit.start(exclude: [TAG: true])`

## Testing Contexts

- A `context` is simply a module with functions to a particular area of our business domain.
- `use AppName.DataCase` provides functionality for working with `contexts` and `schemas`.
- A `describe` block is a feature in `ExUnit` that allows us to group similar tests.
- The file `test/support/data_case.ex` is another `ExUnit.CaseTemplate`.
    - `alias Hello.Repo`.
    - `import Ecto`.
    - `import Ecto.Changeset`.
    - `import Ecto.Query`.
    - `import Hello.DataCase`.
- The SQL Sandbox is precisely what allows our tests to write to the database without affecting any of the other tests.
    - At the beginning of every test, we start a transaction in the database.
    - When the test is over, we automatically rollback the transaction.

```elixir
test "list_posts/0 returns all posts" do
  post = post_fixture()

  assert Blog.list_posts() == [post]
end

test "create_post/1 with valid data creates a post" do
  valid_attrs = %{body: "some body", title: "some title"}

  assert {:ok, %Post{} = post} = Blog.create_post(valid_attrs)
  assert post.body == "some body"
  assert post.title == "some title"
end
```

## Testing Schemas

- We can test the schema validations by using the `changeset` function.

```elixir
defmodule Hello.Blog.PostTest do
  use Hello.DataCase, async: true
  alias Hello.Blog.Post

  test "title must be at least two characters long" do
    changeset = Post.changeset(%Post{}, %{title: "I"})

    assert %{title: ["should be at least 2 character(s)"]} = errors_on(changeset)
  end
end
```

## Testing Controllers

- Under the `test/APP_NAME_web/controllers` folder.
- The files are named as `MODULE_controller_test.exs`.
- They assert the status code and the response body and the html response.
    - The `redirected_params(conn)` function returns the parameters of the redirected URL.
    - The `redirected_to(conn)` function returns the redirected URL.
    - The `html_response(conn, status)` function returns the HTML response of the given status.
    - The `assert_error_sent/3` function asserts that the given error is sent.
- The `controller` works as the `integration` layer.
- In the `controller` tests we simply want to verify that we handle both success and failure scenarios.
- All of the different `rules` and `outcomes` should be verified in your `context` and `schema` tests.
- The `fixtures` module is used to create and manage the test data.
- The `setup` callback is used to create the test data before each test.
    - It `injects` different params into the test `context`.

```elixir
defmodule HelloWeb.PageControllerTest do
  use HelloWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  end
end
```

```elixir
defmodule HelloWeb.PostControllerTest do
  use HelloWeb.ConnCase

  import Hello.BlogFixtures

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}
  
  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get(conn, ~p"/posts")
      assert html_response(conn, 200) =~ "Listing Posts"
    end
  end
end
```

## JSON Controller tests

- The JSON APIs do not need to expose the `new` and `edit` actions.
- The `json_response` function is used to parse the JSON response.

```elixir
describe "index" do
  test "lists all articles", %{conn: conn} do
    conn = get(conn, ~p"/api/articles")

    assert json_response(conn, 200)["data"] == []
  end

  test "renders errors when data is invalid", %{conn: conn} do
    conn = post(conn, ~p"/api/articles", article: @invalid_attrs)

    assert json_response(conn, 422)["errors"] != %{}
  end
end
```

## Testing Channels

- TBD
