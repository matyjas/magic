defmodule MagicWeb.TelegramController do
  use MagicWeb, :controller

  alias Telegram.{Update, Gateway}
  
  def updates(conn, params) do

    params
    |> Update.extract_sender_date
    |> send_message 

    text conn, "ok"
  end

  defp send_message({sender_id, date}) do
    Gateway.send_message(sender_id, date)
  end

  defp send_message({:unhandled_update_type, update}) do
    IO.inspect "WARNING :: unhandled update type>>"
    IO.inspect update    
  end
end
