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
    _pwd = System.cwd!()
    spawn fn -> System.cmd("python3", [Path.join([:code.priv_dir(:expyplot), @pyserver_location]), Integer.to_string(@pyport)]) end
    {:ok, %{}}
  end

  ## Helper Functions
end
