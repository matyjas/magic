defmodule Telegram.Gateway do
  use GenServer
  
  alias Telegram.{Token}

  ## client side

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end
  
  def send_message(sender_id, text) do
    
  end

  ## server side callbacks

  def init(:ok) do
    {:ok, []}
  end

  def handle_cast({:send_message, to_id, message}, state) do
    url = "https://api.telegram.org/bot" <> Token.value <> "/sendMessage"
    body = Poison.encode!(%{"chat_id": to_id, "text": message})
    HTTPotion.post url, [body: body, headers: ["Content-Type": "application/json"]]
    {:noreply, state}
  end
end
