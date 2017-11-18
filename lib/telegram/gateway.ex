defmodule Telegram.Gateway do

  alias Telegram.{Token}
  
  def send_message() do
    url = "https://api.telegram.org/bot" <> Token.value <> "/sendMessage"
    body = Poison.encode!(%{"chat_id": 228303213, "text": "maybe?"})
    HTTPotion.post url, [body: body, headers: ["Content-Type": "application/json"]]
  end
end
