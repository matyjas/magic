defmodule Dialog.Convo do
  use GenServer

  # client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end
  
  # server

  def init(:ok) do
    {:ok, []}
  end
end
