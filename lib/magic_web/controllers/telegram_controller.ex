defmodule MagicWeb.TelegramController do
  use MagicWeb, :controller

  alias Dialog.Convo
  
  def updates(conn, params) do

    {:ok, pid} = Convo.start_link []
    Convo.add_utterance pid, params
    
    text conn, "ok"
  end
end
