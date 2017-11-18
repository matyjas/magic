defmodule MagicWeb.TelegramController do
  use MagicWeb, :controller

  def updates(conn, params) do

#    IO.inspect params

    text conn, "ok"
  end
end
