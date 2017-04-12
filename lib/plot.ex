defmodule Expyplot.Plot do
  @moduledoc """
  This is the end-user API for pyplot.
  """

  def hist(x, bins \\ nil, range \\ nil, normed \\ false, weights \\ nil, cumulative \\ false, bottom \\ nil, histtype \\ :bar, align \\ :mid, orientation \\ :vertical,
           rwidth \\ nil, log \\ false, color \\ nil, label \\ nil, stacked \\ false, hold \\ nil, data \\ nil, opts \\ []) do
    #code = Codebuilder.build_code(funcname: "hist", nonnamed: x, named: [{"bins", bins}, {"range", range}, {"normed", normed}, {"weights", weights}, {"cumulative", cumulative},
    #                                                                     {"bottom", bottom}, {"histtype", histtype}, {"align", align}, {"orientation", orientation},
    #                                                                     {"rwidth", rwidth}, {"log", log}, {"color", color}, {"label", label}, {"stacked", stacked}, {"hold", hold},
    #                                                                     {"data", data}], kwargs: opts)
    code = "\nplt.xlabel(\"smarts\")"
    Server.Commapi.add_code code
  end

  def show do
    Server.Commapi.execute()
  end
end
