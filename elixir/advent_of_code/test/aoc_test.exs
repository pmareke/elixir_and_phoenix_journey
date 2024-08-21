defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  test "greets the world" do
    assert AOC.hello() == :world
  end
end
