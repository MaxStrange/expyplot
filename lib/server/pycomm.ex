defmodule Server.Pycomm do
  use GenServer
  @moduledoc """
  This module is a GenServer that manages the Python code that will be executed.

  The general idea is that you will call functions in the library's API and this will usually add
  code here. Then when you call Pyex.Plot.show(), it will flush the code to the Python3
  interpretor, thus making the plot.
  """

  ## Client API

  @doc """
  Starts the server.
  """
  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  @doc """
  Adds the given code to the buffer.
  """
  def add_code(pid, code) do
    GenServer.call(pid, {:add, code})
  end

  @doc """
  Gets the code currently held in the buffer.
  """
  def get_code(pid) do
    GenServer.call(pid, {:get})
  end

  @doc """
  Deletes the code currently in the buffer.
  """
  def delete_code(pid) do
    GenServer.call(pid, {:delete})
  end

  @doc """
  Executes the code and flushes the buffer.
  """
  def execute(pid) do
    execute_no_flush pid
    delete_code pid
  end

  @doc """
  Executes the code without flushing the buffer.
  """
 def execute_no_flush(pid) do
   GenServer.cast(pid, {:execute})
 end

  ## Server Callbacks

  def init(:ok) do
    {:ok, ""}
  end

  def handle_call(call, _from, code) do
    case call do
      {:add, new_code} ->
        new_state = code <> new_code
        {:reply, new_state, new_state}
      {:get} ->
        {:reply, code, code}
      {:delete} ->
        {:reply, "", ""}
    end
  end

  def handle_cast(cast, code) do
    case cast do
      {:execute} ->
        System.cmd("python3", ["-c", code], [into: IO.stream(:stdio, :line)])
        {:noreply, code}
    end
  end

  ## Helper Functions
end
