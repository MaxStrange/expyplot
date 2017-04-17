defmodule TitleExample do
  alias Expyplot.Plot

  Plot.plot([1..10])
  Plot.title("Center Title")
  Plot.title("Left Title", [], [loc: :left])
  Plot.title("Right Title", [], [loc: :right])

  Plot.show()
end
