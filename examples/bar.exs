defmodule BarExample do
  alias Expyplot.Plot

  men_means = [20, 35, 30, 35, 27]
  women_means = [25, 32, 34, 20, 25]
  men_std = [2, 3, 4, 1, 2]
  women_std = [3, 5, 2, 3, 3]
  ind = 0..4
  width = 0.35
  yticks = Stream.unfold(0, fn(acc) -> {acc, acc + 10} end) |> Stream.take_while(&(&1 < 81)) |> Enum.to_list

  Plot.bar(ind, men_means, [width: width], color: "#d62728", yerr: men_std, label: "Men")
  Plot.bar(ind, women_means, [width: width, bottom: men_means], yerr: women_std, label: "Women")
  Plot.ylabel("Scores")
  Plot.title("Scores by group and gender")
  Plot.xticks([ind, {"G1", "G2", "G3", "G4", "G5"}])
  Plot.yticks([yticks])
  Plot.legend()
  Plot.show()
end
