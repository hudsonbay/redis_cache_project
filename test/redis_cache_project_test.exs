defmodule RedisCacheProjectTest do
  use ExUnit.Case
  doctest RedisCacheProject

  test "greets the world" do
    assert RedisCacheProject.hello() == :world
  end
end
