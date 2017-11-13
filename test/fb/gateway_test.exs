defmodule FB.GatewayTest do
  use MagicWeb.ConnCase, async: true

  alias FB.Gateway
  
  test "can send messages to fb" do
    _response = Gateway.send("sender-id", "message")
  end
end
