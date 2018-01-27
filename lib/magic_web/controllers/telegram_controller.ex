defmodule MagicWeb.TelegramController do
  use MagicWeb, :controller
  
  def updates(conn, params) do

    Dialog.Router.route_request :telegram_router, params
    
    text conn, "ok"
  end
end
