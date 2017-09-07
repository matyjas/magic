defmodule MagicWeb.FBControllerTest do
  use MagicWeb.ConnCase

  test "GET /api/fb/v0" do
    conn = get build_conn(), "/api/fb/v0", ["hub.mode": "subscribe"]
    assert text_response(conn, 200) =~ "default"
  end

end
