defmodule Dialog.Router do
  use GenServer

  @moduledoc """
  Maps between incoming messages to long running Convo GenServers
  """

  alias __MODULE__
  alias Dialog.Convo

  # state

  @enforce_keys [:message]
  defstruct [:message, lookup: %{}]
  
  # public

  def start_link(opts) do
    GenServer.start_link(__MODULE__, [message: opts[:message]], opts)
  end

  def route_request(pid, req) do
    GenServer.cast pid, {:req, req}
  end
  
  # otp

  def init(message: mess) do
    {:ok, %Router{message: mess}}
  end

  def handle_cast({:req, req}, state) do
    state = case state.message.extract_sender_id(req) do
              {:ok, sender_id} ->
                case Map.fetch(state.lookup, sender_id) do
                  {:ok, pid} ->
                    Convo.add_utterance(pid, req)
                    state
                  :error ->
                    # Convo started here
                    {:ok, pid} = Convo.start_link []
                    Convo.add_utterance pid, req

                    new_lookup = Map.put(state.lookup, sender_id, pid)
                    %{state | :lookup => new_lookup}
                end
              {:error, _msg} ->
                IO.puts "un-routable message, no sender id"
                state
            end
    {:noreply, state}
  end

  # private
  
end
