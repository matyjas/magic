defmodule Dialog.Router do
  use GenServer

  @moduledoc """
  Maps between incoming messages to long running Convo GenServers
  """

  alias Dialog.Convo
  
  # public

  def start_link(opts) do
    GenServer.start_link(__MODULE__, [message: opts[:message]], opts)
  end

  def route_request(pid, req) do
    GenServer.cast pid, {:req, req}
  end
  # otp

  def init(message: mess) do
    {:ok, %{message: mess}}
  end

  def handle_cast({:req, req}, state) do
    {:noreply, state}
  end

  # private
  
end
