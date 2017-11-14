defmodule Telegram.TokenTest do
  use MagicWeb.ConnCase, async: true

  alias Telegram.{Token}

  test "token exists" do
    assert Token.value != nil
  end

end
