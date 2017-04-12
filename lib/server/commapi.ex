defmodule Server.Commapi do
  use Supervisor
  @moduledoc """
  This is the API for the pycomm server. Don't call anything in there except through here.
  This is also its supervisor.
  """

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [ worker(Server.Pycomm, [Server.Pycomm]) ]
    supervise(children, strategy: :one_for_one)
  end

  def add_code(code) do
    Server.Pycomm.add_code(Server.Pycomm, code)
  end

  def execute do
    add_code "\nplt.show()"
    Server.Pycomm.execute Server.Pycomm
  end
end
