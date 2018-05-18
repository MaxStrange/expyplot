defmodule Expyplot.Plot do
  @moduledoc """
  <b>This is the end-user API for pyplot.</b>

  See the matplotlib.plot docs at:
  http://matplotlib.org/api/pyplot_api.html

  <b>Most of these functions are UNTESTED. I know. That's terrible. But you can test them by using them! Then, if they don't work, open an issue on the github:</b>
  https://github.com/MaxStrange/expyplot/issues

  <b>Or better yet, you could write some tests or a patch and open a pull request!</b>

  Also, since the return values are simply the string representations of whatever was returned to the python server, all of the return values
  will need to be converted into actual Elixir datastructures. I would love to get around to changing this behavior in the future, but for now, it is
  as it is. <b>This also means that numpy arrays that are returned are likely to be truncated</b>.

  This documentation is mostly just copied from the matplotlib.plot docs, and much of it isn't translated to Elixir like it should be.
  """

  @doc """
  Plot the autocorrelation of x.
  """
  def acorr(x, opts \\ [hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axis", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot the angle spectrum.

  Compute the angle spectrum (wrapped phase spectrum) of x. Data is padded to a length of pad_to and the windowing function <i>window</i> <b>Not used yet
  in Expyplot</b> is applied to the signal.

  Example call:

  ```elixir
  1..1_000_000 |> Enum.to_list |> Expyplot.Plot.angle_spectrum(x, [_Fs: 2, _Fc: 0, pad_to: nil, sides: "default"])
  ```
  """
  def angle_spectrum(x, opts \\ [_Fs: 2, _Fc: 0, pad_to: nil, sides: :default], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.angle_spectrum", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Annotate the point xy with text s.

  Additional kwargs are passed to Text.
  """
  def annotate(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.annotate", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add an arrow to the axes.

  Draws arrow on specified axis from (x, y) to (x + dx, y + dy). Uses FancyArrow patch to construct the arrow.
  """
  def arrow(x, y, dx, dy, opts \\ [hold: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.arrow", nonnamed: [x, y, dx, dy], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Autoscale the axis view to the data (toggle).

  Convenience method for simple axis view autoscaling. It turns autoscaling on or off, and then, if autoscaling for either axis is on, it
  performs the autoscaling on the specified axis or axes.
  """
  def autoscale(opts \\ [enable: true, axis: :both, tight: nil]) do
    Codebuilder.build_code(funcname: "plt.autoscale", nonnamed: [], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to autumn and apply to current image if any. See help(colormaps) for more information
  """
  def autumn do
    Codebuilder.build_code(funcname: "plt.autumn", nonnamed: [], named: []) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.axes", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a horizontal line across the axis.

  Typical calls:
  ```elixir
  Expyplot.Plot.axhline(linewidth: 4, color: :r)           # Draw a thick red hline at 'y'=0 that spans the xrange
  Expyplot.Plot.axhline(y: 1)                              # Draw a default hline at 'y'=1 that spans the xrange
  Expyplot.Plot.axhline(y: 0.5, xmin: 0.25, xmax: 0.75)    # Draw a default hline at 'y'=0.5 that spans the middle half of the xrange
  ```
  """
  def axhline(opts \\ [y: 0, xmin: 0, xmax: 1, hold: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axhline", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a horizontal span (rectangle) across the axis.

  Draw a horizontal span (rectangle) from ymin to ymax. With the default values of xmin = 0 and xmax = 1, this always spans the xrange,
  regardless of the xlim settings, even if you change them, e.g., with the set_xlim() command. That is, the horizontal extent is in axes
  coords: 0=left, 0.5=middle, 1.0=right but the y location is in data coordinates.
  """
  def axhspan(ymin, ymax, opts \\ [xmin: 0, xmax: 1, hold: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axhspan", nonnamed: [ymin, ymax], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  <b>This is how <i>axis</i> has been implemented in this library: as two functions - a get and a set, rather than just the one</b>
  Convenience method to get or set axis properties.

  This function is of limited usefulness at this stage, as it simply returns the string representation of the current axis.

      iex> Expyplot.Plot.axis_get()
      "(0.0, 1.0, 0.0, 1.0)"

  """
  def axis_get(kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axis", nonnamed: [], named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  <b>This is how <i>axis</i> has been implemented in this library: as two functions - a get and a set, rather than just the one</b>
  Convenience method to get or set axis properties.

  ## Some examples:

      iex> Expyplot.Plot.axis_set("off")  # Turn off the axis lines and labels
      "(0.0, 1.0, 0.0, 1.0)"

      iex> Expyplot.Plot.axis_set("equal") # Changes limits of x and y axis so that equal increments of x and y have the same length
      "(-0.055, 0.055, -0.055, 0.055)"

  """
  def axis_set(v, kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axis", nonnamed: [v], named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a vertical line across the axes.

  ## Examples

  - Draw a thick read vline at <i>x</i> = 0 that spans the yrange:
    ```elixir
    Expyplot.Plot.axvline(linewidth: 4, color: :r)
    ```

  - Draw a default vline at <i>x</i> = 1 that spans the yrange:
    ```elixir
    Expyplot.Plot.axvline(x: 1)
    ```

  - Draw a default vline at <i>x</i> = 0.5 that spans the middle half of the yrange
    ```elixir
    Expyplot.Plot.axvline(x: 0.5, ymin: 0.25, ymax: 0.75)
    ```

  """
  def axvline(opts \\ [x: 0, ymin: 0, ymax: 1, hold: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axvline", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a vertical span (rectangle) across the axes.

  Draw a vertical span (rectangle) from xmin to xmax. With the default values of ymin = 0 and ymax = 1. This always spans the yrange,
  regardless of the ylim settings, even if you change them, e.g., with the set_ylim() command. That is, the vertical extent is in axes
  coords: 0=bottom, 0.5=middle, 1.0=top but the y location is in data coordinates.

  ## Examples

  Draw a vertical, green, translucent rectangle from x = 1.25 to x = 1.55 that spans the yrange of the axes.

      iex> Expyplot.Plot.axvspan(1.25, 1.55, facecolor: :g, alpha: 0.5)
      ""

  """
  def axvspan(xmin, xmax, opts \\ [ymin: 0, ymax: 1, hold: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axvspan", nonnamed: [xmin, xmax], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a bar plot.

  Make a bar plot with rectangles bounded by: <i>left</i>, <i>left + width</i>, <i>bottom</i>, <i>bottom + height</i>
  (left, right, bottom and top edges).
  """
  def bar(left, height, opts \\ [width: 0.8, bottom: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.bar", nonnamed: [left, height], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot a 2-D field of barbs.
  """
  def barbs(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.barbs", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a horizontal bar plot.

  Make a horizontal bar plot with rectangles bounded by: <i>left</i>, <i>left + width</i>, <i>bottom</i>, <i>bottom + height</i>

  (lft, right, bottom and top edges).

  <i>bottom, width, height</i>, and <i>left</i> can be either scalars or sequences
  """
  def barh(bottom, width, opts \\ [height: 0.8, left: nil, hold: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.barh", nonnamed: [bottom, width], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to bone and apply to current image if any.
  """
  def bone do
    Codebuilder.build_code(funcname: "plt.bone", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Make a box and whisker plot.

  Make a box and whisker plot for each column of <i>x</i> or each vector in sequence <i>x</i>. The box extends from the lower to upper quartile values
  of the data, with a line at the median. The whiskers extend from the box to show the range of the data. Flier points are those past the end
  of the whiskers.
  """
  def boxplot(x, opts \\ [notch: nil, sym: nil, vert: nil, whis: nil, positions: nil, widths: nil, patch_artist: nil, bootstrap: nil, usermedians: nil,
                          conf_intervals: nil, meanline: nil, showmeans: nil, showcaps: nil, showbox: nil, showfliers: nil, boxprops: nil, labels: nil,
                          flierprops: nil, medianprops: nil, meanprops: nil, capprops: nil, whiskerprops: nil, manage_xticks: true, autorange: false,
                          zorder: nil, hold: nil, data: nil]) do
    Codebuilder.build_code(funcname: "plt.boxplot", nonnamed: [x], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Plot horizontal bars.

  A collection of horizontal bars spanning <i>yrange</i> with a sequence of <i>xranges</i>.
  """
  def broken_barh(xranges, yrange, opts \\ [hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.broken_barh", nonnamed: [xranges, yrange], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Clear the current axes.
  """
  def cla do
    Codebuilder.build_code(funcname: "plt.cla", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Label a contour plot.
  """
  def clabel(cs, opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.clabel", nonnamed: [cs] ++ opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Clear the current figure.
  """
  def clf do
    Codebuilder.build_code(funcname: "plt.clf", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Set the color limits of the current image.

  To apply clim to all axes images do:
  ```elixir
  clim(vmin: 0, vmax: 0.5)
  ```
  If either <i>vmin</i> or <i>vmax</i> is nil, the image min/max respectively will be used for color scaling.
  """
  def clim(opts \\ [vmin: nil, vmax: nil]) do
    Codebuilder.build_code(funcname: "plt.clim", nonnamed: [], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Close a figure window.

  <i>close()</i> by itself closes the current figure

  <i>close(num)</i> closes figure number <i>num</i>

  <i>close(name)</i> where <i>name</i> is a string, closes figure with that label

  <i>close(:all)</i> closes all the figure windows
  """
  def close(opts \\ []) do
    Codebuilder.build_code(funcname: "plt.close", nonnamed: opts, named: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot the coherence between <i>x</i> and <i>y</i>.

  Plot the coherence between <i>x</i> and <i>y</i>. Coherence is the normalized cross spectral density.
  """
  def cohere(x, y, opts \\ [nfft: 256, _Fs: 2, _Fc: 0, noverlap: 0, pad_to: nil, sides: :default, scale_by_freq: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.cohere", nonnamed: [x, y], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a colorbar to a plot.
  """
  def colorbar(opts \\ [mappable: nil, cax: nil, ax: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.colorbar", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  This is a do-nothing function to provide you with help on how matplotlib handles colors.
  """
  def colors do
    Codebuilder.build_code(funcname: "plt.colors", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot contours.

  contour() and contourf() draw contour lines and filled contours, respectively. Except as noted, function signatures and return values
  are the same for both versions.

  contourf() differs from the MATLAB version in that it does not draw the polygon edges. To draw edges, add line contours with calls to contour().
  """
  def contour(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.contour", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot contours.

  contour() and contourf() draw contour lines and filled contours, respectively. Except as noted, function signatures and return values
  are the same for both versions.

  contourf() differs from the MATLAB version in that it does not draw the polygon edges. To draw edges, add line contours with calls to contour().
  """
  def contourf(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.contourf", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to cool and apply to current image if any.
  """
  def cool do
    Codebuilder.build_code(funcname: "plt.cool", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to copper and apply to current image if any.
  """
  def copper do
    Codebuilder.build_code(funcname: "plt.copper", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot the cross-spectral density.
  """
  def csd(x, y, opts \\ [nfft: 256, _Fs: 2, _Fc: 0, noverlap: 0, pad_to: nil, sides: :default, scale_by_freq: nil, return_line: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.csd", nonnamed: [x, y], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Remove an axes from the current figure. If <i>ax</i> doesn't exist, an error will be raised.
  """
  def delaxes(opts \\ []) do
    Codebuilder.build_code(funcname: "plt.delaxes", nonnamed: opts, named: []) |> Server.Commapi.add_code
  end

  @doc """
  Redraw the current figure.

  This is used to update a figure that has been altered, but not automatically re-drawn. If interactive mode is on (ion()), this should be only
  rarely needed, but there may be ways to modify the state of a figure without marking it as <i>stale</i>.
  """
  def draw do
    Codebuilder.build_code(funcname: "plt.draw", nonnamed: [], name: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot an errorbar graph.

  Plot x versus y with error deltas in yerr and xerr. Vertical errorbars are plotted if yerr is not nil. Horizontal errorbars are plotted if xerr is
  not nil.

  x, y, xerr, and yerr can all be scalars, which plots a single error bar at x, y.
  """
  def errorbar(x, y, opts \\ [yerr: nil, xerr: nil, fmt: "", ecolor: nil, elinewidth: nil, capsize: nil, barsabove: false, lolims: false, uplims: false,
                              xlolims: false, xuplims: false, errorevery: 1, capthick: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.errorbar", nonnamed: [x, y], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot identical parallel lines at specific positions.

  Plot parallel lines at the given <i>positions</i>. <i>positions</i> should be a 1D or 2D array-like object, with each row corresponding to a row or
  column of lines.

  This type of plot is commonly used in neuroscience for representing neural events, where it is commonly called a spike raster, dot raster, or raster plot.

  However, it is useful in any situation where you wish to show the timing or position of multiple sets of discrete events, such as the arrival
  times of people to a business on each day of the month or the date of hurricanes each year of the last century.
  """
  def eventplot(positions, opts \\ [orientation: :horizontal, lineoffsets: 1, linelengths: 1, linewidths: nil, colors: nil, linestyles: :solid,
                                    hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.eventplot", nonnamed: [positions], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Adds a non-resampled image to the figure.
  """
  def figimage(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.figimage", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Place a legend in the figure.
  """
  def figlegend(handles, labels, loc, kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.figlegend", nonnamed: [handles, labels, loc], named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  """
  def fignum_exists(num) do
    Codebuilder.build_code(funcname: "plt.fignum_exists", nonnamed: [num], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Add text to figure.

  Add text to figure at location <i>x, y</i> (relative 0-1 coords).
  """
  def figtext(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.figtext", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Creates a new figure.
  """
  def figure(opts \\ [num: nil, figsize: nil, dpi: nil, facecolor: nil, edgecolor: nil, frameon: true], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.figure", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot filled polygons.
  """
  def fill(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.fill", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make filled polygons between two curves.
  """
  def fill_between_vertical(x, y1, opts \\ [y2: 0, where: nil, interpolate: false, step: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.fill_between", nonnamed: [x, y1], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make filled polygons between two horizontal curves.
  """
  def fill_between_horizontal(y, x1, opts \\ [x2: 0, where: nil, step: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.fill_between", nonnamed: [y, x1], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Find artist objects.

  Recursively find all Artist instances contained in self.
  """
  def findobj(opts \\ [o: nil, match: nil, include_self: true]) do
    Codebuilder.build_code(funcname: "plt.findobj", nonnamed: [], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to flag and apply to current image if any.
  """
  def flag do
    Codebuilder.build_code(funcname: "plt.flag", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Get the current Axes instance on the current figure matching the given keyword args, or create one.
  """
  def gca(kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.gca", named: [], nonnamed: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Get a reference to the current figure.
  """
  def gcf do
    Codebuilder.build_code(funcname: "plt.gcf", named: [], nonnamed: []) |> Server.Commapi.add_code
  end

  @doc """
  Get the current colorable artist. Specifically, returns the current ScalarMappable instance (image or patch collection), or "Nothing" if no
  images or patch collections have been defined. The commands imshow() and figimage() create Image instances, and the commands
  pcolor() and scatter() create Collection instances. The current image is an attribute of the current axes, or the nearest earlier axes
  in the current figure that contains an image.
  """
  def gci do
    Codebuilder.build_code(funcname: "plt.gci", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  """
  def get_current_fig_manager do
    Codebuilder.build_code(funcname: "plt.get_current_fig_manager", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Return a list of existing figure labels.
  """
  def get_figlabels do
    Codebuilder.build_code(funcname: "plt.get_figlabels", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Return a list of existing figure numbers.
  """
  def get_fignums do
    Codebuilder.build_code(funcname: "plt.get_fignums", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Get a sorted list of all of the plotting commands.
  """
  def get_plot_commands do
    Codebuilder.build_code(funcname: "plt.get_plot_commands", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  This will wait for <i>n</i> clicks from the user and return a list of the coordinates of each click.

  If <i>timeout</i> is zero or negative, does not timeout.

  If <i>n</i> is zero or negative, accumulated clicks until a middle click (or potentially both mouse buttons at once) terminates the input.

  Right clicking cancels last input.

  The buttons used for the various actions (adding points, removing points, terminating the inputs) can be overriden via the arguments
  <i>mouse_add, mouse_pop</i> and <i>mouse_stop</i>, that give the associated mouse button: 1 for left, 2 for middle, 3 for right.

  The keyboard can also be used to select points in case your mouse does not have one or more of the buttons. The delete and backspace
  keys act like right clicking (i.e., remove last point), the enter key terminates input and any other key (not already used by the window
  manager) selects a point.
  """
  def ginput(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.ginput", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to gray and apply to current image if any.
  """
  def gray do
    Codebuilder.build_code(funcname: "plt.gray", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Turn the axes grids on or off.

  Set the axes grids on or off; <i>b</i> is a boolean. (For MATLAB compatibility, <i>b</i> may also be an atom :on or :off.)
  """
  def grid(opts \\ [b: nil, which: :major, axis: :both], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.grid", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a hexagonal binning plot.

  Make a hexagonal binning plot of <i>x</i> versus <i>y</i>, where <i>x, y</i> are 1-D sequences of the same length, <i>N</i>. If <i>C</i> is
  nil (the default), this is a histogram of the number of occurrences of the observations at (x[i], y[i]).

  If <i>C</i> is specified, it specifies values at the coordinate (x[i], y[i]). These values are accumulated for each hexagonal bin and then reduced
  according to <i>reduce_C_function</i>, which defaults to numpy's mean function (np.mean). (If <i>C</i> is specified, it must also be a 1-D sequence
  of the same length as <i>x</i> and <i>y</i>.)
  """
  def hexbin(x, y, opts \\ [c: nil, gridsize: 100, bins: nil, xscale: :linear, yscale: :linear, extent: nil, cmap: nil, norm: nil, vmin: nil, vmax: nil,
                            alpha: nil, linewidths: nil, edgecolors: :none, mincnt: nil, marginals: false, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.hexbin", nonnamed: [x, y], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot a histogram.

  Compute and draw the histogram of <i>x</i>. The return value is a tuple (<i>n, bins, patches</i>) or (<i>[n0, n1, ...], bins, [patches0, patches1, ...]</i>)
  if the input contains multiple data.

  Multiple data can be provided via <i>x</i> as a list of datasets of potentially different length, or as a 2-D ndarray in which each column is a dataset.
  Note that the ndarray form is transposed relative to the list form.

  Masked arrays are not supported at present.
  """
  def hist(x, opts \\ [bins: nil, range: nil, normed: false, weights: nil, cumulative: false, bottom: nil, histtype: :bar, align: :mid, orientation: :vertical,
                       rwidth: nil, log: false, color: nil, label: nil, stacked: false, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.hist", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a 2D histogram plot.
  """
  def hist2d(x, y, opts \\ [bins: 10, range: nil, normed: false, weights: nil, cmin: nil, cmax: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.hist2d", nonnamed: [x, y], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot horizontal lines at each <i>y</i> from <i>xmin</i> to <i>xmax</i>.
  """
  def hlines(y, xmin, xmax, opts \\ [colors: :k, linestyles: :solid, label: "", hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.hlines", nonnamed: [y, xmin, xmax], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to hot and apply to current image if any.
  """
  def hot do
    Codebuilder.build_code(funcname: "plt.hot", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to hsv and apply to current image if any.
  """
  def hsv do
    Codebuilder.build_code(funcname: "plt.hsv", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Read an image from a file into an array.

  <i>fname</i> may be a string path, or a valid URL.

  If <i>format</i> is provided, will try to read file of that type, otherwise the format is deduced from the filename. If nothing can be deduced, PNG
  is tried.

  Return value is a numpy.array <b>But in expyplot, this will return a string, and it probably won't work</b>. For grayscale images, the return array is MxN.
  For RGB images, the return value is MxNx4.

  matplotlib can only read PNGs natively, but if PIL is installed, it will use it to load the image and return an array (if possible) which can
  be used with imshow(). Note, URL strings may not be compatible with PIL. Check the PIL documentation for more information.
  """
  def imread(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.imread", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Save an array as an image file.

  The output formats available depend on the backend being used.
  """
  def imsave(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.imsave", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Display an image on the axes.
  """
  def imshow(x, opts \\ [cmap: nil, norm: nil, aspect: nil, interpolation: nil, alpha: nil, vmin: nil, vmax: nil,
                         origin: nil, extent: nil, shape: nil, filternorm: 1, filterrad: 4.0, imlim: nil, resample: nil,
                         url: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.imshow", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to inferno and apply to current image if any.
  """
  def inferno do
    Codebuilder.build_code(funcname: "plt.inferno", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Turn interactive mode off.
  """
  def ioff do
    Codebuilder.build_code(funcname: "plt.ioff", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Turn interactive mode on.
  """
  def ion do
    Codebuilder.build_code(funcname: "plt.ion", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Return status of interactive mode.
  """
  def isinteractive do
    Codebuilder.build_code(funcname: "plt.isinteractive", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Set the default coormap to jet and apply to current image if any.
  """
  def jet do
    Codebuilder.build_code(funcname: "plt.jet", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Places a legend on the axes.
  """
  def legend(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.legend", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Control behavior of tick locators.
  """
  def locator_params(opts \\ [axis: :both, tight: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.locator_params", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a plot with log scaling on both the <i>x</i> and <i>y</i> axis.

  loglog() supports all the keyword arguments of plot() and matplotlib.axes.Axes.set_xscale() / matplotlib.axes.Axes.set_yscale().
  """
  def loglog(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.loglog", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to magma and apply to current image if any.
  """
  def magma do
    Codebuilder.build_code(funcname: "plt.magma", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot the magnitude spectrum.
  """
  def magnitude_spectrum(x, opts \\ [_Fs: nil, _Fc: nil, window: nil, pad_to: nil, sides: nil, scale: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.magnitude_spectrum", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set or retrieve autoscaling margins.
  """
  def margins(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.margins", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Display an array as a matrix in a new figure window.

  The origin is set at the upper left hand corner and rows (first dimension of the array) are displayed horizontally. The aspect ratio of the
  figure window is that of the array, unless this would make an excessively short or narrow figure.

  Tick labels for the xaxis are placed on top.
  """
  def matshow(a, opts \\ [fignum: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.matshow", nonnamed: [a], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Remove minor ticks from the current plot.
  """
  def minorticks_off do
    Codebuilder.build_code(funcname: "plt.minorticks_off", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to nipy_spectral and apply to current image if any.
  """
  def nipy_spectral do
    Codebuilder.build_code(funcname: "plt.nipy_spectral", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Pause for <i>interval</i> seconds.

  If there is an active figure it will be updated and displayed, and the GUI event loop will run during the pause.

  If there is no active figure, or if a non-interactive backend is in use, this executes time.sleep(interval).

  This can be used for crude animation.
  """
  def pause(interval) do
    Codebuilder.build_code(funcname: "plt.interval", nonnamed: [interval], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Create a pseudocolor plot of a 2-D array.
  """
  def pcolor(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.pcolor", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot a quadrilateral mesh.
  """
  def pcolormesh(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.pcolormesh", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot the phase spectrum.
  """
  def phase_spectrum(x, opts \\ [_Fs: nil, _Fc: nil, window: nil, pad_to: nil, sides: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.phase_spectrum", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot a pie chart.

  Make a pie chart of array x. The fractional area of each wedge is given by x / sum(x). If sum(x) <= 1, then the values of x give the fractional
  area directly and the array will not be normalized. The wedges are plotted counterclockwise, by default starting from the x-axis.
  """
  def pie(x, opts \\ [explode: nil, labels: nil, colors: nil, autopct: nil, pctdistance: 0.6, shadow: false, labeldistance: 1.1, startangle: nil,
                      radius: nil, counterclock: true, wedgeprops: nil, textprops: nil, center: {0, 0}, frame: false, hold: nil, data: nil]) do
    Codebuilder.build_code(funcname: "plt.pie", nonnamed: [x], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to pink and apply to current image if any.
  """
  def pink do
    Codebuilder.build_code(funcname: "plt.pink", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to plasma and apply to current image if any.
  """
  def plasma do
    Codebuilder.build_code(funcname: "plt.plasma", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot lines and/or markers to the Axes. <i>args</i> is a variable length argument, allowing for multiple <i>x, y</i> pairs with an optional format string.

  Each of the following is legal:
  ```elixir
  x = 1..10 |> Enum.to_list
  y = 11..20 |> Enum.to_list
  Expyplot.Plot.plot([x, y])          # plot x and y using default line style and color
  Expyplot.Plot.plot([x, y, "bo"])    # plot x and y using blue circle markers
  Expyplot.Plot.plot([y])             # plot y using x as index array 0..N-1
  Expyplot.Plot.plot([y, "r+"])       # ditto, but with red plusses

  x2 = 1..5 |> Enum.to_list
  y2 = 3..7 |> Enum.to_list
  Expyplot.Plot.plot([x, y, "g^", x2, y2, "g-"])
  ```

  Due to the differences between function signatures in Python and Elixir, the typical usage of this function is a little different than what you would
  expect:

      iex> Expyplot.Plot.plot([[1, 2, 3, 4, 5]])
      nil

      or

      iex> Expyplot.Plot.plot([1..5])
      nil

  Notice the nesting of the list or range.

  ## Examples with keyword args

  ```elixir
  Expyplot.Plot.plot([[1, 2, 3], [1, 2, 3], "go-"], label: "line 1", linewidth: 2)
  Expyplot.Plot.plot([[1, 2, 3], [1, 4, 9], "rs"], label: "line 2")
  Expyplot.Plot.axis_set([0, 4, 0, 10])  # Notice that this signature is 'axis_set', not 'axis' as in matplotlib
  Expyplot.Plot.legend()
  ```
  """
  def plot(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.plot", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  A plot with data that contains dates.
  """
  def plot_date(x, y, opts \\ [fmt: :o, tz: nil, xdate: true, ydate: false, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.plot_date", nonnamed: [x, y], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot the data in a file.
  """
  def plotfile(fname, opts \\ [cols: {0}, plotfuncs: nil, comments: "#", skiprows: 0, checkrows: 5, delimiter: ",", names: nil, subplots: true,
                               newfig: true], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.plotfile", nonnamed: [fname], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  make a polar plot.
  """
  def polar(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.polar", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to prism and apply to current image if any.
  """
  def prism do
    Codebuilder.build_code(funcname: "plt.prism", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot the power spectral density.
  """
  def psd(x, opts \\ [nfft: nil, _Fs: nil, _Fc: nil, detrend: nil, window: nil, noverlap: nil, pad_to: nil, sides: nil, scale_by_freq: nil,
                      return_line: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.psd", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot a 2-D field of arrows.
  """
  def quiver(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.quiver", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a key to a quiver plot.
  """
  def quiverkey(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.quiverkey", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the current rc params. Group is the grouping for the rc.
  """
  def rc(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.rc", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Restore the default rc params. These are not the params loaded by the rc file, but mpl's internal params. See rc_file_defaults for reloading
  the default params from the rc file.
  """
  def rcdefaults do
    Codebuilder.build_code(funcname: "plt.rcdefaults", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Get or set the radial gridlines on a polar plot.
  """
  def rgrids(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.rgrids", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Save the current figure.
  """
  def savefig(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.savefig", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a scatter plot of x vs y.

  Marker size is scaled by s and marker color is mapped to c.
  """
  def scatter(x, y, opts \\ [s: nil, c: nil, marker: nil, cmap: nil, norm: nil, vmin: nil, vmax: nil, alpha: nil,
                             linewidths: nil, verts: nil, edgecolors: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.scatter", nonnamed: [x, y], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a plot with log scaling on the x axis.
  """
  def semilogx(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.semilogx", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a plot with log scaling on the y axis.
  """
  def semilogy(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.semilogy", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap. Applies to the current image if any.

  <i>cmap</i> must be the name of a registered colormap.
  """
  def set_cmap(cmap) do
    Codebuilder.build_code(funcname: "plt.set_cmap", nonnamed: [cmap], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Display a figure.
  """
  def show(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.show", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot a spectrogram.
  """
  def specgram(x, opts \\ [nfft: nil, _Fs: nil, _Fc: nil, detrend: nil, window: nil, noverlap: nil, cmap: nil, xextent: nil, pad_to: nil,
                           sides: nil, scale_by_freq: nil, mode: nil, scale: nil, vmin: nil, vmax: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.specgram", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to spectral and apply to current image if any.
  """
  def spectral do
    Codebuilder.build_code(funcname: "plt.spectral", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to spring and apply to current image if any.
  """
  def spring do
    Codebuilder.build_code(funcname: "plt.spring", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot the sparsity pattern on a 2-D array.

  spy(z) plots the sparsity pattern of the 2-D array <i>z</i>.
  """
  def spy(z, opts \\ [precision: 0, marker: nil, markersize: nil, aspect: :equal], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.spy", nonnamed: [z], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Draws a stacked area plot.
  """
  def stackplot(x, opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.stackplot", nonnamed: [x] ++ opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Create a stem plot.
  """
  def stem(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.stem", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a step plot.
  """
  def step(x, y, opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.step", nonnamed: [x, y] ++ opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Draws streamlinkes of a vector flow.
  """
  def streamplot(x, y, u, v, opts \\ [density: 1, linewidth: nil, color: nil, cmap: nil, norm: nil, arrowsize: 1, arrowstyle: "-|>", minlength: 0.1, transform: nil,
                                      zorder: nil, start_points: nil, hold: nil, data: nil]) do
    Codebuilder.build_code(funcname: "plt.streamplot", nonnamed: [x, y, u, v], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Return a subplot axes positioned by the given grid definition.
  """
  def subplot(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.subplot", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Create a subplot in a grid. The grid is specified by <i>shape</i>, at location of <i>loc</i>, spanning <i>rowspan, colspan</i> cells in each direction.
  The index for loc is 0-based.
  """
  def subplot2grid(shape, loc, opts \\ [rowspan: 1, colspan: 1], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.subplot2grid", nonnamed: [shape, loc], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Launch a subplot tool window for a figure.
  """
  def subplot_tool(opts \\ [targetfig: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.subplot_tool", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Create a figure and a set of subplots.

  This utility wrapper makes it convenient to create common layouts of subplots, including the enclosing figure object, in a single call.
  """
  def subplots(opts \\ [nrows: 1, ncols: 1, sharex: false, sharey: false, squeeze: true, subplot_kw: nil, gridspec_kw: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.subplots", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Tune the subplot layout.
  """
  def subplots_adjust(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.subplots_adjust", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to summer and apply to current image if any.
  """
  def summer do
    Codebuilder.build_code(funcname: "plt.summer", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Add a centered title to the figure.
  """
  def suptitle(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.suptitle", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a table to the current axes.
  """
  def table(kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.table", nonnamed: [], named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add text to the axes.

  Add text in string <i>s</i> to axis at location <i>x, y</i> data coordinates.
  """
  def text(x, y, s, opts \\ [fontdict: nil, withdash: false], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.text", nonnamed: [x, y, s], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Get or set the theta locations of the gridlines in a polar plot.

  If no arguments are passed, return a tuple (<i>lines, labels</i>) where <i>lines</i> is an array of radial gridlines (Line2D instances) and <i>labels</i>
  is an array of tick labels (Text instances).
  """
  def thetagrids(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.thetagrids", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Change the appearance of ticks and tick labels.
  """
  def tick_parameters(opts \\ [axis: :both], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.tick_parameters", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Change the ScalarFormatter used by default for linear axes.
  """
  def ticklabel_format(kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.ticklabel_format", nonnamed: [], named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Automatically adjust subplot parameters to give specified padding.
  """
  def tight_layout(opts \\ [pad: 1.08, h_pad: nil, w_pad: nil, rect: nil]) do
    Codebuilder.build_code(funcname: "plt.tight_layout", nonnamed: [], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Set a title of the current axes.

  Set one of hte three available axes titles. The available titles are positioned above the aces in the center, flush with the left edge, and flush
  with the right edge.
  """
  def title(s, opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.title", nonnamed: [s] ++ opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Draw contours on an unstructured triangular grid tricontour() and tricontourf() draw contour lines and filled contours,
  respectively.
  """
  def tricontour(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.tricontour", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Draw contours on an unstructured triangular grid tricontour() and tricontourf() draw contour lines and filled contours,
  respectively.
  """
  def tricontourf(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.tricontourf", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Create a pseudocolor plot of an unstructured triangular grid.
  """
  def tripcolor(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.tripcolor", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Draw an unstructured triangular grid as lines and/or markers.
  """
  def triplot(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.triplot", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Make a second axes that shares the <i>x</i>-axis. The new axes will overlay <i>ax</i> (or the current axes if <i>ax</i> is nil). The ticks for
  <i>ax2</i> will be placed on the right, and the <i>ax2</i> instance is returned.
  """
  def twinx(opts \\ [ax: nil]) do
    Codebuilder.build_code(funcname: "plt.twinx", nonnamed: [], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Make a second axes that shares the <i>y</i>-axis. The new axis will overlay <i>ax</i> (or the current axes if <i>ax</i> is nil). The ticks for
  <i>ax2</i> will be placed on the top, and the <i>ax2</i> instance is returned.
  """
  def twiny(opts \\ [ax: nil]) do
    Codebuilder.build_code(funcname: "plt.twiny", nonnamed: [], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Uninstalls the matplotlib display hook.
  """
  def uninstall_repl_displayhook do
    Codebuilder.build_code(funcname: "plt.uninstall_repl_displayhook", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Make a violin plot.

  Make a violin plot for each column of <i>dataset</i> or each vector in sequence <i>dataset</i>. Each filled area extends to represent the entire data
  range, with optional lines at the mean, the median, the minimum, and the maximum.
  """
  def violinplot(dataset, opts \\ [positions: nil, vert: true, widths: 0.5, showmeans: false, showextrema: true, showmedians: false, points: 100, bw_method: nil,
                                   hold: nil, data: nil]) do
    Codebuilder.build_code(funcname: "plt.violinplot", nonnamed: [dataset], named: opts) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to viridis and apply to current image if any.
  """
  def viridis do
    Codebuilder.build_code(funcname: "plt.viridis", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot vertical lines.

  Plot vertical lines at each <i>x</i> from <i>ymin</i> to <i>ymax</i>.
  """
  def vlines(x, ymin, ymax, opts \\ [colors: :k, linestyles: :solid, label: "", hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.vlines", nonnamed: [x, ymin, ymax], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Blocking call to interact with the figure.

  This will return "True" if a key was pressed, "False" if a mouse button was pressed and "None" if timeout was reached without either being pressed.

  If <i>timeout</i> is negative, does not timeout.
  """
  def waitforbuttonpress(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.waitforbuttonpress", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the default colormap to winter and apply to current image if any.
  """
  def winter do
    Codebuilder.build_code(funcname: "plt.winter", nonnamed: [], named: []) |> Server.Commapi.add_code
  end

  @doc """
  Plot the cross correlation between <i>x</i> and <i>y</i>.
  """
  def xcorr(x, y, opts \\ [normed: true, usevlines: true, maxlags: 10, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.xcorr", nonnamed: [x, y], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Turns xkcd sketch-style drawing mode. This will only have effect on things drawn after this function is called.

  For best results, the "Humor Sans" font should be indstalled: it is not included with matplotlib.
  """
  def xkcd(opts \\ [scaled: 1, length: 100, randomness: 2], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.xkcd", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the x axis label of the current axis.
  """
  def xlabel(s, opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.xlabel", nonnamed: [s] ++ opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Get or set the <i>x</i> limits of the current axes.
  """
  def xlim(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.xlim", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the scaling of the x-axis.
  """
  def xscale(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.xscale", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Get or set the x-limits of the current tick locations and labels.
  """
  def xticks(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.xticks", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the y-axis label of the current axis.
  """
  def ylabel(s, opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.ylabel", nonnamed: [s] ++ opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Get or set the y-limits of the current axes.
  """
  def ylim(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.ylim", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the scaling of the y-axis.
  """
  def yscale(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.yscale", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Get or set the y-limits of the current tick locations and labels.
  """
  def yticks(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.yticks", nonnamed: opts, named: kwargs) |> Server.Commapi.add_code
  end
end
