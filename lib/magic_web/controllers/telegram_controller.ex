defmodule MagicWeb.TelegramController do
  use MagicWeb, :controller

  alias Dialog.Router
  
  def updates(conn, params) do

    {:ok, pid} = Router.start_link(message: Telegram.Update)
    Router.route_request pid, params
    
    text conn, "ok"
  end
end
