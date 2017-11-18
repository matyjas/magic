defmodule Telegram.GatewayTest do
  use MagicWeb.ConnCase, async: true

  alias Telegram.{Gateway}
  
  @maciej_id 228303213

  test "send message to maciej" do
    resp = Gateway.send_message @maciej_id, "send test working"
    assert resp != nil
  end
end
