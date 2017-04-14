defmodule Server.Pysupervisor do
  use Supervisor
  @moduledoc """
  This is the Supervisor for the python code. It restarts it whenever it goes down.
  """

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [ worker(Server.Pyserver, [Server.Pyserver]) ]
    supervise(children, strategy: :one_for_one)
  end
end
