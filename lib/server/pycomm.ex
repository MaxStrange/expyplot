defmodule Server.Pycomm do
  use GenServer
  @moduledoc """
  This module is a GenServer that manages the Python code that will be executed.

  The general idea is that you will call functions in the library's API and this will usually add
  code here. Then when you call Expyplot.Plot.show(), it will flush the code to the Python3
  interpretor, thus making the plot.
  """

  @pyport 9849

  ## Client API

  @doc """
  Starts the server.
  """
  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  @doc """
  Adds the given code to the buffer.
  """
  def eval_code(pid, code) do
    GenServer.call(pid, {:eval, code})
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, _to_python} = :gen_tcp.connect('localhost', @pyport, [:binary, packet: :line, active: false])
  end

  def handle_call(call, _from, to_python) do
    case call do
      {:eval, code} ->
        return_val = send_to_python(code, to_python)
        {:reply, return_val, to_python}
    end
  end

  ## Helper Functions

  defp send_to_python(code, to_python) do
    write_line(code, to_python)
    read_line(to_python)
  end

  defp read_line(from) do
    {:ok, data} = :gen_tcp.recv(from, 0)
    data
  end

  defp write_line(line, to) do
    :gen_tcp.send(to, line)
  end
end
