defmodule SpectralExample do
  alias Expyplot.Plot

  dt = 0.01
  fs = 1 / dt
  t = Stream.unfold(0, fn(acc) -> {acc, acc + dt} end) |> Stream.take_while(&(&1 < 10)) |> Enum.to_list
  nse = t |> Enum.map(fn(_) -> Statistics.Distributions.Normal.rand() end) |> Enum.to_list
  r = t |> Enum.map(&(Statistics.Math.exp(- &1 / 0.05)))

  cnse = nse |> Enum.map(&(&1 * Enum.random(r))) |> Enum.take(length(t)) # fake convolution. I didn't feel like writing a functional convolution.
  s = t |> Enum.map(&(:math.sin(2 * Statistics.Math.pi * &1)))

  Plot.subplot([3, 2, 1])
  Plot.plot([t, s])

  Plot.subplot([3, 2, 1])
  Plot.plot([t, s])

  Plot.subplot([3, 2, 3])
  Plot.magnitude_spectrum(s, _Fs: fs)

  Plot.subplot([3, 2, 4])
  Plot.magnitude_spectrum(s, _Fs: fs, scale: :dB)

  Plot.subplot([3, 2, 5])
  Plot.angle_spectrum(s, _Fs: fs)

  Plot.subplot([3, 2, 6])
  Plot.phase_spectrum(s, _Fs: fs)

  Plot.show()
end


