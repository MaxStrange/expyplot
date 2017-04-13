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

      iex> Expyplot.Plot.hist(1..5)
      1..5
  """
  def hist(x, opts \\ [bins: nil, range: nil, normed: false, weights: nil, cumulative: false, bottom: nil, histtype: :bar, align: :mid, orientation: :vertical,
                       rwidth: nil, log: false, color: nil, label: nil, stacked: false, hold: nil, data: nil], kwargs \\ []) do
    local_x = if Enumerable.impl_for(x), do: Enum.to_list(x), else: x
    code = Codebuilder.build_code(funcname: "plt.hist", nonnamed: [local_x], named: opts ++ kwargs)
    Server.Commapi.add_code code
    x
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
