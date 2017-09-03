defmodule FB.TokenVerifyTest do
  use MagicWeb.ConnCase, async: true
  
  test "check fb values match" do
    challenged = "c-rock"
    assert FB.Token.verify?("subscribe", "tokenized", challenged) ==
    {:match, challenged}
  end

end
