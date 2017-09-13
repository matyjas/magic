defmodule FB.GatewayTest do
  use MagicWeb.ConnCase, async: true

  alias FB.Gateway
  
  test "can send messages to fb" do
    response = Gateway.send("sender-id", "message")
    IO.inspect response
  end
end
