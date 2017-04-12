defmodule HistogramExample do
  # Example to generate a histogram of IQ scores. Taken from
  # http://matplotlib.org/1.2.1/examples/pylab_examples/histogram_demo.html
  alias Expyplot.Plot
  alias Expyplot.Mlab

  {mu, sigma} = {100, 15}
  x =
    Stream.take_every(1..10_000, 1)
    |> Stream.map(fn(_) -> Statistics.Distributions.Normal.rand(mu, sigma) end)
    |> Enum.to_list

  #{n, bins, patches} = Plot.hist(x, 50, normed: 1, facecolor: "green", alpha: 0.75)
  #
  #y = Mlab.normpdf(bins, mu, sigma)
  #l = Plot.plot(bins, y, "r--", linewidth: 1)
  #
  #Plot.xlabel("Smarts")
  #Plot.ylabel("Probability")
  #Plot.title("TODO") # TODO
  #Plot.axis([40, 160, 0, 0.03])
  #Plot.grid(True)
  #
  #Plot.show()
end
