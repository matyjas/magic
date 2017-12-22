defmodule Dialog.Convo do
  use GenServer

  alias Telegram.{Update, Gateway}
  
  # public

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def add_utterance(pid, utterance) when is_pid(pid) do
    GenServer.cast(pid, {:add_utterance, utterance})
  end

  def get_utterances(pid) when is_pid(pid) do
    GenServer.call(pid, :get_utterances)
  end
  
  # otp
  
  def init(:ok) do
    {:ok, []}
  end

  # empty state means this is the beginning of our conversation
  def handle_cast({:add_utterance, utterance}, []) do
    onboarding utterance
    {:noreply, [ utterance ] }
  end
  
  def handle_cast({:add_utterance, utterance}, state) do
    respond utterance, state
    {:noreply, [ utterance | state ] }
  end

  def handle_call(:get_utterances, _from, state) do
    {:reply, state, state}
  end

  # private

  defp onboarding(utterance) do
    case Update.extract_sender_date(utterance) do
      {:ok, sender_id, date} ->
	text = Onboard.Greet.get(date)
	send_onboarding sender_id, text, Meditations.Meditation.sample
      _ ->
	:error
    end
  end
  
  defp respond(utterance, history) do
    # send this feedback link - https://maciejmatyjas.typeform.com/to/HCTng6
  end
  
  defp send_message(sender_id, text) do
    {:ok, pid} = Gateway.start_link([])
    Gateway.send_message(pid, sender_id, text)    
  end

  defp send_meditation(sender_id, meditation) do
    {:ok, pid} = Gateway.start_link([])
    Gateway.send_meditation(pid, sender_id, meditation)
  end

  defp send_onboarding(sender_id, text, meditation) do
    {:ok, pid} = Gateway.start_link([])
    Gateway.send_onboarding(pid, sender_id, text, meditation)
  end
end
