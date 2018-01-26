defmodule Dialog.DialogSupervisor do
  use Supervisor

  @moduledoc """
  Top level supervisor for conversation hierarchy
  """

  # public

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts)
  end

  # otp

  def init(opts) do
    router_name = opts[:router_name]
    children = [%{id: router_name, start: {Dialog.Router, :start_link, [opts]}}]
    Supervisor.init children, strategy: :one_for_all
  end
end
