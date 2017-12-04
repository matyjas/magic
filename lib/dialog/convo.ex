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

  def handle_cast({:add_utterance, utterance}, state) do
    respond utterance
    {:noreply, [ utterance | state ] }
  end

  def handle_call(:get_utterances, _from, state) do
    {:reply, state, state}
  end

  # private

  defp respond(utterance) do
    utterance
    |> Update.extract_sender_date
    |> send_message 
  end

  defp send_message({:unhandled_update_type, update}) do
    IO.inspect "WARNING :: unhandled update type>>"
    IO.inspect update    
  end
  
  defp send_message({sender_id, date}) do
    text = Onboard.Greet.get(date)
    {:ok, pid} = Gateway.start_link([])
    Gateway.send_message(pid, sender_id, text)
  end
end
