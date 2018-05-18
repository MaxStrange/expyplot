defmodule Expyplot.Export do
  @moduledoc """
  Wrapper for Erlport stolen from the interwebs.
  """

  @doc """
  Start the python instance.

  ## Examples

    iex> pid = Expyplot.Export.start()
    iex> is_pid(pid)
    true

  """
  def start(opts \\ []) do
    default_opts = [buffer_size: 65_536, call_timeout: :infinity, cd: '.',
                    compressed: 5, start_timeout: 5_000, python: 'python',
                    python_path: ['.']]
    opts = Keyword.merge(default_opts, opts)
    {:ok, pid} = :python.start(opts)
    pid
  end

  @doc """
  Execute the given function found in the given module with the given arguments and
  return the result.

  ## Examples

    iex> pid = Expyplot.Export.start()
    iex> Expyplot.Export.call(pid, :operator, :add, [5, 2])
    7

  """
  def call(pid, mod, func, args \\ []) do
    res = :python.call(pid, mod, func, args)
    case res do
      :undefined -> nil
      x -> x
    end
  end

  @doc """
  Stops the Python instance.

  ## Examples

    iex> pid = Expyplot.Export.start()
    iex> Expyplot.Export.stop(pid)
    :ok

  """
  def stop(pid) do
    :python.stop(pid)
  end
end
