defmodule Server.Pycomm do
  use GenServer
  @moduledoc """
  This module is a GenServer that manages the Python code that will be executed.

  The general idea is that you will call functions in the library's API and this will usually add
  code here. Then when you call Expyplot.Plot.show(), it will flush the code to the Python3
  interpretor, thus making the plot.
  """

  @pyport 9849
  @signal "$<>;;<>%"

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
      {:eval, ""} ->
        raise ArgumentError, message: "Cannot supply Python with empty code string"
      {:eval, code} ->
        return_val = send_to_python(code, to_python)
        {:reply, return_val, to_python}
    end
  end

  ## Helper Functions

  defp send_to_python(code, to_python) do
    do_send_to_python(code, to_python)
  end

  defp do_send_to_python(code, to_python) do
    max_size = 4096 - String.length(@signal)
    chunk = code |> String.slice(0..max_size)
    leftover = code |> String.slice((max_size + 1)..-1)
    cond do
      String.length(chunk) <= max_size ->
        write_line(chunk <> "\n" <> @signal, to_python)
        received = read_line to_python
        IO.puts "Got back:"
        IO.inspect received
        received
      String.length(chunk) > max_size ->
        write_line(chunk, to_python)
        do_send_to_python(leftover, to_python)
    end
  end

  defp read_line(from) do
    do_read_line(from, "")
  end

  defp do_read_line(from, acc) do
    {:ok, data} = :gen_tcp.recv(from, 0)
    if String.ends_with?(data, @signal <> "\n") do
      i = String.length(data) - (String.length(@signal <> "\n") + 1)
      last = String.slice(data, 0..i)
      acc <> last
    else
      do_read_line(from, acc <> data)
    end
  end

  defp write_line(line, to) do
    IO.puts "Sending:"
    IO.inspect(line)
    :gen_tcp.send(to, line)
  end
end
