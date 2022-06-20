defmodule PatTest do
  use ExUnit.Case
  doctest Pat

  test "greets the world" do
    assert Pat.hello() == :world
  end
end
