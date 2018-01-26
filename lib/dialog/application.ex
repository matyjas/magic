defmodule Dialog.Application do
  use Application

  @moduledoc """
  Owns conversation hierarchy
  """
  
  def start(_type, opts) do
    Dialog.DialogSupervisor.start_link(opts)
  end
end
