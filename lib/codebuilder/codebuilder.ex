defmodule Codebuilder do
  @moduledoc """
  This module holds the functions that translate Elixir function calls into Python function calls.
  """

  def build_code(funcname: name, nonnamed: args, named: namedargs, kwargs: kwargs) do
    args_string = args |> Enum.map(stringify_variable/1) |> stringify_arg_list
    namedargs_string = namedargs |> Enum.map(stringify_namedargs/1) |> stringify_arg_list
    kwargs_string = kwargs |> Enum.map(stringify_namedargs/1) |> stringify_arg_list

    code = "\n" <> name <> "(" <> args_string <> namedargs_string <> kwargs_string <> ")"
  end

  ## These functions take a variable and turn it into its Python representation, then into a string from there
  defp stringify_variable(v), when is_atom(v) do: Atom.to_string v
  defp stringify_variable(v), when is_binary(v) do: Binary.to_string v #TODO
  defp stringify_variable(v), when is_bitstring(v) do: Bitstring.to_string v #TODO
  defp stringify_variable(v), when is_boolean(v) do: if v, do: "True", else: "False"
  defp stringify_variable(v), when is_float(v) do: Float.to_string v
  defp stringify_variable(v), when is_integer(v) do: Integer.to_string v
  defp stringify_variable(v) when is_list(v) do
    stringified_list = v |> Enum.map(stringify_variable/1) |> Enum.map(&(&1 <> ", "))
    # TODO: return "[" a + "," for a in stringified_list unless a is last item + "]"
  end
  defp stringify_variable(v) when is_map(v) do
    # TODO: Convert to python dictionary
  end
  defp stringify_variable(v) when is_tuple(v) do:
    # TODO: Exactly the same as stringified list, except with parentheses rather than square brackets
  end
end
