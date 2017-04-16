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
  Make a hexagonal binning plot.

  Make a hexagonal binning plot of <i>x</i> versus <i>y</i>, where <i>x, y</i> are 1-D sequences of the same length, <i>N</i>. If <i>C</i> is
  nil (the default), this is a histogram of the number of occurrences of the observations at (x[i], y[i]).

  If <i>C</i> is specified, it specifies values at the coordinate (x[i], y[i]). These values are accumulated for each hexagonal bin and then reduced
  according to <i>reduce_C_function</i>, which defaults to numpy's mean function (np.mean). (If <i>C</i> is specified, it must also be a 1-D sequence
  of the same length as <i>x</i> and <i>y</i>.)
  """
  def hexbin(x, y, opts \\ [c: nil, gridsize: 100, bins: nil, xscale: :linear, yscale: :linear, extent: nil, cmap: nil, norm: nil, vmin: nil, vmax: nil,
                            alpha: nil, linewidths: nil, edgecolors: :none, mincnt: nil, marginals: false, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.hexbin", named: [x, y], nonnamed: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.imread", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Save an array as an image file.

  The output formats available depend on the backend being used.
  """
  def imsave(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.imsave", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.legend", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.loglog", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
  def magnitude_spectrum(x, opts \\ [fs: nil, fc: nil, window: nil, pad_to: nil, sides: nil, scale: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.magnitude_spectrum", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Set or retrieve autoscaling margins.
  """
  def margins(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.margins", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.pcolor", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot a quadrilateral mesh.
  """
  def pcolormesh(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.pcolormesh", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot the phase spectrum.
  """
  def phase_spectrum(x, opts \\ [fs: nil, fc: nil, window: nil, pad_to: nil, sides: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.phase_spectrum", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot a pie chart.

  Make a pie chart of array x. The fractional area of each wedge is given by x / sum(x). If sum(x) <= 1, then the values of x give the fractional
  area directly and the array will not be normalized. The wedges are plotted counterclockwise, by default starting from the x-axis.
  """
  def pie(x, opts \\ [explod: nil, labels: nil, colors: nil, autopct: nil, pctdistance: 0.6, shadow: false, labeldistance: 1.1, startangle: nil,
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
  """
  def plot(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.plot", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
    Codebuilder.build_code(funcname: "plt.polar", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
  def psd(x, opts \\ [nfft: nil, fs: nil, fc: nil, detrend: nil, window: nil, noverlap: nil, pad_to: nil, sides: nil, scale_by_freq: nil,
                      return_line: nil, hold: nil, data: nil], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.psd", nonnamed: [x], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Plot a 2-D field of arrows.
  """
  def quiver(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.quiver", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
  end

  @doc """
  Add a key to a quiver plot.
  """
  def quiverkey(opts \\ [], kwargs \\ []) do
    Codebuilder.build_code(funcname: "plt.quiverkey", nonnamed: [], named: opts ++ kwargs) |> Server.Commapi.add_code
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
