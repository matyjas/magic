defmodule Telegram.Gateway do
  use GenServer
  
  alias Telegram.{Token}

  @stateless {}
  
  ## client side

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end
  
  def send_message(pid, to_id, text) do
    GenServer.cast(pid, {:send_message, to_id, text})
  end

  ## server side callbacks

  def init(:ok) do
    {:ok, @stateless}
  end

  def handle_cast({:send_message, to_id, message}, _state) do
    url = "https://api.telegram.org/bot" <> Token.value <> "/sendMessage"
    body = Poison.encode!(%{"chat_id": to_id, "text": message})
    response = HTTPotion.post url, [body: body, headers: ["Content-Type": "application/json"]]
    cond do
      !HTTPotion.Response.success?(response) ->
	inspect response
    end
    {:stop, :normal, @stateless}
  end
end
