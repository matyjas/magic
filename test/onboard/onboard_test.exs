defmodule Onboard.GreetTest do
  use MagicWeb.ConnCase, async: true

  alias Onboard.Greet

  test "00 - has onboarding" do
    greeting = Greet.get 1000
    assert nil != greeting
  end
end
