defmodule Expyplot.Plot do
  @moduledoc """
  This is the end-user API for pyplot.
  """

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
                         rwidth: nil, log: false, color: nil, label: nil, stacked: false, hold: nil, data: nil]) do
    code = Codebuilder.build_code(funcname: "plt.hist", nonnamed: [x], named: opts)
    Server.Commapi.add_code code
    IO.inspect code
    :ok
  end

  def show do
    Server.Commapi.execute()
  end
end
