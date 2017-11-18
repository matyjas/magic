defmodule MagicWeb.TelegramControllerTest do
  use MagicWeb.ConnCase

  test "200 for the win" do
    conn = post build_conn(), "/api/telegram/v0"
    assert conn.status == 200
  end
end
