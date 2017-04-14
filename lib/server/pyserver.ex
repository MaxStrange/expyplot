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
    # TODO: if I am developing, this is where I am
    #spawn fn -> System.cmd("python3", [pwd <> "/lib/server/" <> @pyserver_location, Integer.to_string(@pyport)]) end

    # TODO: if I am a library, this is where I am
    spawn fn -> System.cmd("python3", [pwd <> "/deps/expyplot/lib/server/" <> @pyserver_location, Integer.to_string(@pyport)]) end
    {:ok, %{}}
  end

  def terminate(reason, state) do
    # kill the python3 instance here
    # TODO: Send a special kill signal to the python program that it will watch for.
    :normal
  end

  ## Helper Functions
end
