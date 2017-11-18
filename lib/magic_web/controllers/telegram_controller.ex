defmodule MagicWeb.TelegramController do
  use MagicWeb, :controller

  alias Telegram.{Update}
  
  def updates(conn, params) do

    params
    |> Update.extract_sender_date
    |> IO.inspect 

    text conn, "ok"
  end
end
