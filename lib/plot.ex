defmodule Expyplot.Plot do
  @moduledoc """
  This is the end-user API for pyplot.

  http://matplotlib.org/api/pyplot_api.html

  <b>Most of these functions are UNTESTED. I know. That's terrible. But you can test them by using them! Then, if they don't work, open an issue on the github:</b>
  https://github.com/MaxStrange/expyplot/issues

  <b>Or better yet, you could write some tests or a patch and open a pull request!</b>
  """

  @doc """
  Plot the autocorrelation of x.
  """
  def acorr(x, opts \\ [hold: nil, data: nil], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.axis", nonnamed: [x], named: opts ++ kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Plot the angle spectrum.

  Compute the angle spectrum (wrapped phase spectrum) of x. Data is padded to a length of pad_to and the windowing function window <b>Not used yet
  in Expyplot</b> is applied to the signal.
  """
  def angle_spectrum(x, opts \\ [fs: 2, fc: 0, pad_to: nil, sides: :default], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.angle_spectrum", nonnamed: [x], named: opts ++ kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Annotate the point xy with text s.

  Additional kwargs are passed to Text.
  """
  def annotate(opts \\ [], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.annotate", nonnamed: [], named: opts ++ kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Add an arrow to the axes.

  Draws arrow on specified axis from (x, y) to (x + dx, y + dy). Uses FancyArrow patch to construct the arrow.
  """
  def arrow(x, y, dx, dy, opts \\ [hold: nil], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.arrow", nonnamed: [x, y, dx, dy], named: opts ++ kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Autoscale the axis view to the data (toggle).

  Convenience method for simple axis view autoscaling. It turns autoscaling on or off, and then, if autoscaling for either axis is on, it
  performs the autoscaling on the specified axis or axes.
  """
  def autoscale(opts \\ [enable: true, axis: :both, tight: nil]) do
    code = Codebuilder.build_code(funcname: "plt.autoscale", nonnamed: [], named: opts)
    Server.Commapi.add_code code
  end

  @doc """
  Set the default colormap to autumn and apply to current image if any. See help(colormaps) for more information
  """
  def autumn do
    code = Codebuilder.build_code(funcname: "plt.autumn", nonnamed: [], named: [])
    Server.Commapi.add_code code
  end

  @doc """
  Add an axes to the figure.

  The axes is added at position rect specified by:

  - axes() by itself creates a default full subplot(111) window axis.
  - axes(rect, [facecolor: :w]), where rect = [left, bottom, width, height] in normalized (0, 1) units. facecolor is the background
    color for the axis, default white.
  - axes(h) where h is an axes instance makes h the current axis.
  """
  def axes(opts \\ [], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.axes", nonnamed: [], named: opts ++ kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Add a horizontal line across the axis.
  """
  def axhline(opts \\ [y: 0, xmin: 0, xmax: 1, hold: nil], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.axhline", nonnamed: [], named: opts ++ kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Add a horizontal span (rectangle) across the axis.

  Draw a horizontal span (rectangle) from ymin to ymax. With the default values of xmin = 0 and xmax = 1, this always spans the xrange,
  regardless of the xlim settings, even if you change them, e.g., with the set_xlim() command. That is, the horizontal extent is in axes
  coords: 0=left, 0.5=middle, 1.0=right but the y location is in data coordinates.
  """
  def axhspan(ymin, ymax, opts \\ [xmin: 0, xmax: 1, hold: nil], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.axhspan", nonnamed: [ymin, ymax], named: opts ++ kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  <b>This is how <i>axis</i> has been implemented in this library: as two functions - a get and a set, rather than just the one</b>
  Convenience method to get or set axis properties.
  """
  def axis_get(kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.axis", nonnamed: [], named: kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  <b>This is how <i>axis</i> has been implemented in this library: as two functions - a get and a set, rather than just the one</b>
  Convenience method to get or set axis properties.
  """
  def axis_set(v, kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.axis", nonnamed: [v], named: kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Add a vertical line across the axes.
  """
  def axvline(opts \\ [x: 0, ymin: 0, ymax: 1, hold: nil], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.axvline", nonnamed: [], named: opts ++ kwargs)
    Server.Commapi.add_code code
  end

  @doc """
  Add a vertical span (rectangle) across the axes.

  Draw a vertical span (rectangle) from xmin to xmax. With the default values of ymin = 0 and ymax = 1. This always spans the yrange,
  regardless of the ylim settings, even if you change them, e.g., with the set_ylim() command. That is, the vertical extent is in axes
  coords: 0=bottom, 0.5=middle, 1.0=top but the y location is in data coordinates.
  """
  def axvspan(xmin, xmax, opts \\ [ymin: 0, ymax: 1, hold: nil], kwargs \\ []) do
    code = Codebuilder.build_code(funcname: "plt.axvspan", nonnamed: [xmin, xmax], named: opts ++ kwargs)
    Server.Commapi.add_code code
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
  Histogram function. See matplotlib docs for hist:
  http://matplotlib.org/api/pyplot_api.html
  """
  def hist(x, opts \\ [bins: nil, range: nil, normed: false, weights: nil, cumulative: false, bottom: nil, histtype: :bar, align: :mid, orientation: :vertical,
                       rwidth: nil, log: false, color: nil, label: nil, stacked: false, hold: nil, data: nil], kwargs \\ []) do
    local_x = if Enumerable.impl_for(x), do: Enum.to_list(x), else: x
    code = Codebuilder.build_code(funcname: "plt.hist", nonnamed: [local_x], named: opts ++ kwargs)
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
    code = Codebuilder.build_code(funcname: "plt.show", nonnamed: [], named: [])
    Server.Commapi.add_code code
  end
end
