defmodule Telegram.Gateway do
  use GenServer

  alias Meditations.{Meditation}
  
  @stateless {}
  
  ## client side

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end
  
  def send_message(pid, to_id, text) do
    GenServer.cast(pid, {:send_message, to_id, text})
  end

  def send_meditation(pid, to_id, meditation) do
    GenServer.cast(pid, {:send_meditation, to_id, meditation})
  end

  def send_onboarding(pid, to_id, text, meditation) do
    GenServer.cast(pid, {:send_onboarding, to_id, text, meditation})
  end
  
  ## server side callbacks

  def init(:ok) do
    {:ok, @stateless}
  end

  def handle_cast({:send_message, to_id, message}, _stateless) do
    send_message to_id, message
    {:stop, :normal, @stateless}
  end

  def handle_cast({:send_meditation, to_id, meditation}, _stateless) do
    send_meditation to_id, meditation
    {:stop, :normal, @stateless}
  end

  def handle_cast({:send_onboarding, to_id, text, meditation}, _stateless) do
    send_message to_id, text
    send_meditation to_id, meditation
    {:stop, :normal, @stateless}
  end

  ## private

  defp send_message(to_id, message) do
    body = Poison.encode!(%{"chat_id": to_id, "text": message})
    request("/sendMessage", body)
  end

  defp send_meditation(to_id, %Meditation{title: title, audio_url: audio_url}) do
    body = Poison.encode!(%{"chat_id": to_id,
			    "audio": audio_url,
			    "title": title})
    request("/sendAudio", body)
  end
  
  defp prepare_url(suffix), do: "https://api.telegram.org/bot" <> Telegram.Token.value <> suffix

  defp request(suffix, body) do
    response = HTTPotion.post prepare_url(suffix),
      [body: body, headers: ["Content-Type": "application/json"], follow_redirects: true]
    cond do
      !HTTPotion.Response.success?(response) ->
	inspect response
      response.status_code != 200 ->
	inspect response
      true ->
	inspect response.body
    end
    response
  end
end
