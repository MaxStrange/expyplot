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
    ls = [Path.join([:code.priv_dir(:expyplot), @pyserver_location]), Integer.to_string(@pyport)]
    python3 = System.find_executable "python3"
    python = System.find_executable "python"
    case python3 do
      nil -> spawn fn -> System.cmd(python, ls) end
      _ -> spawn fn -> System.cmd(python3, ls) end
    end
    {:ok, %{}}
  end

  ## Helper Functions
end
