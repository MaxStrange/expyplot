defmodule AcorrExample do
  alias Expyplot.Plot

  x = 1..100 |> Enum.map(fn(_) -> Statistics.Distributions.Normal.rand() end)
  y = 1..100 |> Enum.map(fn(_) -> Statistics.Distributions.Normal.rand() end)

  Plot.xcorr(x, y, usevlines: true, maxlags: 50, normed: true, lw: 2)
  Plot.grid(b: true)
  Plot.axhline(y: 0, color: :black, lw: 2)
  Plot.show()
end
