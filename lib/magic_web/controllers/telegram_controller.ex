defmodule MagicWeb.TelegramController do
  use MagicWeb, :controller

  alias Dialog.{Router,Convo}
  
  def updates(conn, params) do

    {:ok, pid} = Router.start_link(message: Telegram.Update)
    Router.route_request pid, params
    
    {:ok, pid} = Convo.start_link []
    Convo.add_utterance pid, params
    
    text conn, "ok"
  end
end
