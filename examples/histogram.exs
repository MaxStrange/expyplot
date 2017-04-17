defmodule HistogramExample do
  alias Expyplot.Plot

  {mu, sigma} = {100, 15}
  x = 1..10_000 |> Stream.map(fn(_) -> Statistics.Distributions.Normal.rand(mu, sigma) end) |> Enum.to_list

  Plot.hist(x, bins: 50, normed: 1, facecolor: :green, alpha: 0.75)
  Plot.xlabel("Smarts")
  Plot.ylabel("Probability")
  Plot.title("IQ Scores")
  Plot.axis_set([40, 160, 0, 0.03])
  Plot.grid(b: true)

  Plot.show()
end
