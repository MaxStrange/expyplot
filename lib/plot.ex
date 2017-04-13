defmodule Expyplot.Plot do
  @moduledoc """
  This is the end-user API for pyplot.
  """

  @doc """
  Convenience method to get or set axis properties.
  """
  def axis(kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.axis", nonnamed: [], named: kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Histogram function. See matplotlib docs for hist:
  http://matplotlib.org/api/pyplot_api.html

  #TODO: This needs to return something - so it needs to communicate with a python process that is running as a server

  ## Examples

      iex> Expyplot.Plot.hist([50, 100], normed: 1, facecolor: :green, alpha: 0.75)
      :ok

      iex> Expyplot.Plot.hist([20])
      :ok

      iex> Expyplot.Plot.hist([5, 10, 15], log: true)
      :ok

      iex> Expyplot.Plot.hist([23, 45], data: %{money: 5, people: [24, "money"]})
      :ok
  """
  def hist(x, opts \\ [bins: nil, range: nil, normed: false, weights: nil, cumulative: false, bottom: nil, histtype: :bar, align: :mid, orientation: :vertical,
                       rwidth: nil, log: false, color: nil, label: nil, stacked: false, hold: nil, data: nil], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.hist", nonnamed: [x], named: opts ++ kwargs)
    Server.Commapi.add_code code
    :ok
  end

  @doc """
  Turn the axes grids on or off.

  Set the axes grids on or off; b is a boolean. (For MATLAB compatibility, b may also be a string, ‘on’ or ‘off’.)

  If b is None and len(kwargs)==0, toggle the grid state. If kwargs are supplied, it is assumed that you want a grid and b is thus set to True.

  which can be ‘major’ (default), ‘minor’, or ‘both’ to control whether major tick grids, minor tick grids, or both are affected.

  axis can be ‘both’ (default), ‘x’, or ‘y’ to control which set of gridlines are drawn.
  """
  def grid(opts \\ [b: nil, which: :major, axis: :both], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.grid", nonnamed: [], named: opts ++ kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Set a title of the current axes.

  Set one of hte three available axes titles. The available titles are positioned above the aces in the center, flush with the left edge, and flush
  with the right edge.
  """
  def title(s, kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.title", nonnamed: [s], named: kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Set the x axis label of the current axis.
  """
  def xlabel(s, kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.xlabel", nonnamed: [s], named: kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Set the y axis label of the current axis.
  """
  def ylabel(s, kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.ylabel", nonnamed: [s], named: kwargs)
    Server.Commapi.add_code code
  end

  def show do
    Server.Commapi.get_code() |> IO.inspect
    Server.Commapi.execute()
  end
end
