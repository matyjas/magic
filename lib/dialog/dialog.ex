defmodule Dialog.Application do
  use Application

  @moduledoc """
  Owns conversation hierarchy
  """
  
  def start(_type, _args) do
    import Supervisor.Spec

    children = []

    opts = [strategy: :one_for_all]
    Supervisor.start_link(children, opts)
  end
end
