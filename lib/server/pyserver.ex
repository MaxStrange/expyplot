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
    system_python = get_python()
    spawn fn -> System.cmd(system_python, [Path.join([:code.priv_dir(:expyplot), @pyserver_location]), Integer.to_string(@pyport)]) end
    {:ok, %{}}
  end

  ## Helper Functions

  defp get_python do
    # Check the system for python3, then for pyhon
    if System.find_executable("python3") do
      "python3"
    else
      "python"
    end
  end
end
