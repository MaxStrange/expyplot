defmodule Codebuilder do
  @moduledoc """
  This module holds the functions that translate Elixir function calls into Python function calls.
  """

  def build_code(funcname: name, nonnamed: args, named: namedargs, kwargs: kwargs) do
    args_string = args |> Enum.map(&stringify_variable/1) |> Enum.reduce("", fn(x, acc) -> acc <> x end)
    namedargs_string = namedargs |> Enum.map(&stringify_namedarg/1) |> Enum.reduce("", fn(x, acc) -> acc <> x end)
    kwargs_string = kwargs |> Enum.map(&stringify_namedarg/1) |> Enum.reduce("", fn(x, acc) -> acc <> x end) |> String.slice(0..-2)

    "\n" <> name <> "(" <> args_string <> namedargs_string <> kwargs_string <> ")"
  end

  ## These functions take a variable and turn it into its Python representation, then into a string from there
  defp stringify_variable(v) when is_atom(v), do: if v == nil, do: "None", else: Atom.to_string v
  defp stringify_variable(v) when is_boolean(v), do: if v, do: "True", else: "False"
  defp stringify_variable(v) when is_float(v), do: Float.to_string v
  defp stringify_variable(v) when is_integer(v), do: Integer.to_string v
  defp stringify_variable(v) when is_list(v) do
    list_as_str = v |> Enum.reduce("", fn (x, acc) -> acc <> stringify_variable(x) end) |> String.slice(0..-2)
    "[" <> list_as_str <> "]"
  end
  defp stringify_variable(v) when is_map(v) do
    # TODO: Convert to python dictionary
  end
  defp stringify_variable(v) when is_tuple(v) do
     list_as_str = v |> Enum.reduce("", fn (x, acc) -> acc <> stringify_variable(x) end) |> String.slice(0..-2)
    "(" <> list_as_str <> ")"
  end

  defp stringify_namedarg({name, val}) do
    name <> "=" <> stringify_variable(val)
  end
end
