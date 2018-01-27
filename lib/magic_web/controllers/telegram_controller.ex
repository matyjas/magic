defmodule MagicWeb.TelegramController do
  use MagicWeb, :controller
  
  def updates(conn, params) do

    IO.inspect params
    
    Dialog.Router.route_request :telegram_router, params
    
    text conn, "ok"
  end
end
