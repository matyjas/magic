defmodule Dialog.Convo do
  use GenServer

  # client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def add_utterance(pid, utterance) when is_pid(pid) do
    GenServer.cast(pid, {:add_utterance, utterance})
  end

  def get_utterances(pid) when is_pid(pid) do
    GenServer.call(pid, :get_utterances)
  end
  
  # server
  
  def init(:ok) do
    {:ok, []}
  end

  def handle_cast({:add_utterance, utterance}, state) do
    {:noreply, [ utterance | state ] }
  end

  def handle_call(:get_utterances, _from, state) do
    {:reply, state, state}
  end
end
