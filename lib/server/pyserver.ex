defmodule Server.Pyserver do
  use GenServer

  @pyport 9849
  @pyserver_location "mat.py"

  ## Client API

  @doc """
  Starts the server.
  """
  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  ## Server Callbacks

  def init(:ok) do
    pwd = System.cwd!()
    System.cmd("python3", [pwd <> "/lib/server/" <> @pyserver_location, Integer.to_string(@pyport)], [into: IO.stream(:stdio, :line)])
    {:ok, %{}}
  end

  def terminate(reason, state) do
    # kill the python3 instance here
    # TODO: Send a special kill signal to the python program that it will watch for.
    :normal
  end

  ## Helper Functions
end
