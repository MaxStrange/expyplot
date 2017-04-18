defmodule ZorderExample do
  alias Expyplot.Plot

  x = 1..20 |> Enum.map(fn(_) -> Statistics.Distributions.Normal.rand() end) |> Enum.to_list
  y = 1..20 |> Enum.map(fn(_) -> Statistics.Distributions.Normal.rand() end) |> Enum.to_list

  Plot.figure()
  Plot.subplot([2, 1, 1])
  Plot.plot([x, y, :r], [lw: 3])
  Plot.scatter(x, y, [s: 120])
  Plot.title("Lines on top of dots")

  Plot.subplot([2, 1, 2])
  Plot.plot([x, y, :r], [zorder: 1, lw: 3])
  Plot.scatter(x, y, [s: 120], [zorder: 2])
  Plot.title("Dots on top of lines")

  Plot.show()
end
