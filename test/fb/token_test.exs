defmodule FB.TokenVerifyTest do
  use MagicWeb.ConnCase, async: true

  test "local token value exists" do
    assert FB.Token.local_value != nil
    assert is_binary FB.Token.local_value
  end
  
  test "invalid token" do
    challenged = "c-rock"
    assert FB.Token.verify?("subscribe", "tokenized", challenged) ==
    {:miss}
  end

  test "check fb values match" do
    challenged = "c-rock"
    assert FB.Token.verify?("subscribe", FB.Token.local_value, challenged) ==
    {:match, challenged}
  end
  
end
