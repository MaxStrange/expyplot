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
    Codebuilder.build_code(funcname: "plt.axis", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot the angle spectrum.

  Compute the angle spectrum (wrapped phase spectrum) of x. Data is padded to a length of pad_to and the windowing function window <b>Not used yet
  in Expyplot</b> is applied to the signal.
  """
  def angle_spectrum(x, opts \\ [fs: 2, fc: 0, pad_to: nil, sides: :default], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.angle_spectrum", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Annotate the point xy with text s.

  Additional kwargs are passed to Text.
  """
  def annotate(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.annotate", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.axes", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a horizontal line across the axis.
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
  """
  def axis_get(kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axis", nonnamed: [], named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  <b>This is how <i>axis</i> has been implemented in this library: as two functions - a get and a set, rather than just the one</b>
  Convenience method to get or set axis properties.
  """
  def axis_set(v, kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axis", nonnamed: [v], named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a vertical line across the axes.
  """
  def axvline(opts \\ [x: 0, ymin: 0, ymax: 1, hold: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.axvline", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a vertical span (rectangle) across the axes.

  Draw a vertical span (rectangle) from xmin to xmax. With the default values of ymin = 0 and ymax = 1. This always spans the yrange,
  regardless of the ylim settings, even if you change them, e.g., with the set_ylim() command. That is, the vertical extent is in axes
  coords: 0=bottom, 0.5=middle, 1.0=top but the y location is in data coordinates.
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
    Codebuilder.build_code(funcname: "plt.barbs", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.clabel", nonnamed: [cs], named: opts ++ kwargs) |> Server.Commapi.add_code
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
  clim(0, 0.5)
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
    Codebuilder.build_code(funcname: "plt.close", nonnamed: opts) |> Server.Commapi.add_code
  end

  @doc """
  Plot the coherence between <i>x</i> and <i>y</i>.

  Plot the coherence between <i>x</i> and <i>y</i>. Coherence is the normalized cross spectral density.
  """
  def cohere(x, y, opts \\ [nfft: 256, fs: 2, fc: 0, noverlap: 0, pad_to: nil, sides: :default, scale_by_freq: nil, hold: nil, data: nil], kwargs \\ []) do
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
    Codebuilder.build_code(funcname: "plt.contour", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot contours.

  contour() and contourf() draw contour lines and filled contours, respectively. Except as noted, function signatures and return values
  are the same for both versions.

  contourf() differs from the MATLAB version in that it does not draw the polygon edges. To draw edges, add line contours with calls to contour().
  """
  def contourf(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.contourf", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
  def csd(x, y, opts \\ [nfft: 256, fs: 2, fc: 0, noverlap: 0, pad_to: nil, sides: :default, scale_by_freq: nil, return_line: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.csd", nonnamed: [x, y], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Remove an axes from the current figure. If <i>ax</i> doesn't exist, an error will be raised.
  """
  def delaxes(opts \\ []) do
    Codebuilder.build_code(funcname: "plt.delaxes", nonnamed: [], named: opts) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.figimage", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
  Histogram function. See matplotlib docs for hist:
  http://matplotlib.org/api/pyplot_api.html
  """
  def hist(x, opts \\ [bins: nil, range: nil, normed: false, weights: nil, cumulative: false, bottom: nil, histtype: :bar, align: :mid, orientation: :vertical,
                       rwidth: nil, log: false, color: nil, label: nil, stacked: false, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.hist", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add text to figure.

  Add text to figure at location <i>x, y</i> (relative 0-1 coords).
  """
  def figtext(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.figtext", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.fill", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.ginput", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.grid", named: [], nonnamed: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set a title of the current axes.

  Set one of hte three available axes titles. The available titles are positioned above the aces in the center, flush with the left edge, and flush
  with the right edge.
  """
  def title(s, kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.title", nonnamed: [s], named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the x axis label of the current axis.
  """
  def xlabel(s, kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.xlabel", nonnamed: [s], named: kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set the y axis label of the current axis.
  """
  def ylabel(s, kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.ylabel", nonnamed: [s], named: kwargs) |> Server.Commapi.add_code
  end

  def show do
    Codebuilder.build_code(funcname: "plt.show", nonnamed: [], named: []) |> Server.Commapi.add_code
  end
end
