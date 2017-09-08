defmodule FB.TokenVerifyTest do
  use MagicWeb.ConnCase, async: true

  alias FB.{Token}
  
  test "local token value exists" do
    assert Token.local_value != nil
    assert is_binary Token.local_value
  end
  
  test "invalid token" do
    assert Token.verify?("tokenized", "not gonna happen") ==
    {:miss}
  end

  test "check fb values match" do
    challenged = "c-rock"
    assert Token.verify?(Token.local_value, challenged) ==
    {:match, challenged}
  end
  
end
