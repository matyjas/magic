defmodule MagicWeb.FBControllerTest do
  use MagicWeb.ConnCase

  test "400 on naked request" do
    conn = get build_conn(), "/api/fb/v0"
    assert conn.status == 400
  end
  
  test "403 when token is bad" do
    conn = get build_conn(), "/api/fb/v0", ["hub.mode": "subscribe",
					    "hub.verify_token": "bad-token",
					   "hub.challenge": "doesnt-matter"]
    assert conn.status == 403
  end

  test "happy path" do
    challenge = "winner!"
    conn = get build_conn(), "/api/fb/v0", ["hub.mode": "subscribe",
					    "hub.verify_token": FB.Token.handshake,
					   "hub.challenge": challenge]
    assert text_response(conn, 200) =~ challenge
  end

end
