defmodule Telegram.Gateway do

  alias Telegram.{Token}
  
  def send_message(sender_id, text) do
    url = "https://api.telegram.org/bot" <> Token.value <> "/sendMessage"
    body = Poison.encode!(%{"chat_id": sender_id, "text": text})
    HTTPotion.post url, [body: body, headers: ["Content-Type": "application/json"]]
  end
end
