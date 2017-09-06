defmodule MagicWeb.FBControllerTest do
  use MagicWeb.ConnCase

  test "GET /api/fb/v0", %{conn: conn} do
    conn = get conn, "/api/fb/v0"
    assert text_response(conn, 200) =~ "default"
  end

end
