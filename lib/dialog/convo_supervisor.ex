defmodule Dialog.ConvoSupervisor do
#  use Supervisor

  @moduledoc """
  Supervises conversations with a chat platform
  """

  # public

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts)
  end

  # otp

  def init(_opts) do
 #   Supervisor
  end
end
