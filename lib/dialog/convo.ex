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
    respond utterance
    {:noreply, [ utterance ] }
  end
  
  def handle_cast({:add_utterance, utterance}, state) do
    respond utterance
    {:noreply, [ utterance | state ] }
  end

  def handle_call(:get_utterances, _from, state) do
    {:reply, state, state}
  end

  # private

  defp respond(utterance) do
    case Update.extract_sender_date(utterance) do
      {:unhandled_update_type, update} ->
	IO.inspect "WARNING :: unhandled update from messaging platform>>"
	IO.inspect update    	
      {sender_id, date} ->
	send_message sender_id, date 
	send_meditation sender_id, Meditations.Meditation.sample
    end
  end
  
  defp send_message(sender_id, date) do
    text = Onboard.Greet.get(date)
    {:ok, pid} = Gateway.start_link([])
    Gateway.send_message(pid, sender_id, text)    
  end

  defp send_meditation(sender_id, meditation) do
    {:ok, pid} = Gateway.start_link([])
    Gateway.send_meditation(pid, sender_id, meditation)
  end
end
