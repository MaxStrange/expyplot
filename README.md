# Expyplot

Inspired by this project:
https://github.com/JordiPolo/explot, but I wanted something more transparent.

Expyplot allows you to use 'all' of the functions in matplotlib.plot (in reality, there are some that I left out because they don't make any sense in this context, or
are deprecated).

Unfortunately, I have not tested anywhere near all of the functions, but they should mostly work. If any don't work, please open an issue, or better yet,
make a fix and open a pull request! This library is simple enough that you should be able to grok it without too much effort.

Perhaps the most limiting thing about this library is that it currently has to convert return values from the matplotlib functions into strings before
sending them back to Elixir, so rather than returning `true`, you will get `"True"`, and good luck piecing back to gether complicated objects. The reason I went this route
is that JSON is unable to parse pretty much any complicated data type that comes back from a matplotlib function, and I didn't feel like writing a JSON parser. If you
want to do something about it, please by all means, write a JSON parser capable of serializing all the different return types from matplotlib functions: the python
side of this library is very simple - it is located in priv/mat.py.

## Examples

To run the examples, start an iex -S mix session while in :dev mode and run:

```elixir
Code.load_file "./path/to/example/EXAMPLE.exs"
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `expyplot` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:expyplot, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/expyplot](https://hexdocs.pm/expyplot).

