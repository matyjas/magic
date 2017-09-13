defmodule FB.TokenVerifyTest do
  use MagicWeb.ConnCase, async: true

  alias FB.{Token}
  
  test "handshake token exists" do
    assert Token.handshake != nil
    assert is_binary Token.handshake
  end

  test "page token exists" do
    assert Token.page != nil
    assert is_binary Token.page
  end
  
  test "invalid token" do
    assert Token.verify_handshake?("tokenized", "not gonna happen") ==
    {:miss}
  end

  test "check fb values match" do
    challenged = "c-rock"
    assert Token.verify_handshake?(Token.handshake, challenged) ==
    {:match, challenged}
  end
  
end
