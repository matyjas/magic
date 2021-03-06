defmodule Telegram.GatewayTest do
  use MagicWeb.ConnCase, async: true

  alias Telegram.{Gateway}
  
  @maciej_id 228303213

  test "send message to maciej" do
    {:ok, pid} = Gateway.start_link([])
    resp = Gateway.send_message pid, @maciej_id, "send test working"
    assert resp != nil
  end

  test "gateway is transient" do
    # testing under the client API
    response = Gateway.handle_cast({:send_message,
				    @maciej_id,
				    "transient test in progress"}, {})
    assert response == {:stop, :normal, {}}
  end

  test "send meditation" do
    meditation = Meditations.Meditation.sample
    response = Gateway.handle_cast({:send_meditation,
				    @maciej_id,
				    meditation}, {})
    assert response == {:stop, :normal, {}}
  end
end
