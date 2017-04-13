defmodule Codebuilder do
  @moduledoc """
  This module holds the functions that translate Elixir function calls into Python function calls.
  """

  def build_code(funcname: name, nonnamed: args, named: namedargs) do
    args_string = args |> Enum.map(&stringify_variable/1) |> Enum.reduce("", fn(x, acc) -> acc <> ", " <> x end)
    args_string = if String.ends_with?(args_string, ", "), do: String.slice(args_string, 0..-3), else: args_string
    args_string = if String.starts_with?(args_string, ", "), do: String.slice(args_string, 2..-1), else: args_string
    namedargs_string = namedargs |> Enum.map(&stringify_namedarg/1) |> Enum.reduce("", fn(x, acc) -> acc <> ", " <> x end)

    "\n" <> name <> "(" <> args_string <> namedargs_string <> ")"
  end

  ## These functions take a variable and turn it into its Python representation, then into a string from there
  defp stringify_variable(v) when is_boolean(v), do: if v, do: "True", else: "False"
  defp stringify_variable(v) when is_atom(v), do: if v == nil, do: "None", else: "\"" <> Atom.to_string(v) <> "\""
  defp stringify_variable(v) when is_binary(v), do: "\"" <> v <> "\""
  defp stringify_variable(v) when is_float(v), do: Float.to_string v
  defp stringify_variable(v) when is_integer(v), do: Integer.to_string v
  defp stringify_variable(v) when is_list(v) do
    list_as_str = v |> Enum.reduce("", fn (x, acc) -> acc <> ", " <> stringify_variable(x) end)
    list_as_str = if String.ends_with?(list_as_str, ", "), do: String.slice(list_as_str, 0..-3), else: list_as_str
     list_as_str = if String.starts_with?(list_as_str, ", "), do: String.slice(list_as_str, 2..-1), else: list_as_str
    "[" <> list_as_str <> "]"
  end
  defp stringify_variable(v) when is_map(v) do
    dict_as_str = v |> Enum.reduce("", fn({name, val}, acc) -> acc <> ", " <> stringify_variable(name) <> ": " <> stringify_variable(val) end)
    dict_as_str = if String.starts_with?(dict_as_str, ", "), do: String.slice(dict_as_str, 2..-1), else: dict_as_str
    "{" <> dict_as_str <> "}"
  end
  defp stringify_variable(v) when is_tuple(v) do
     list_as_str = v |> Enum.reduce("", fn (x, acc) -> acc <> ", " <> stringify_variable(x) end)
     list_as_str = if String.ends_with?(list_as_str, ", "), do: String.slice(list_as_str, 0..-3), else: list_as_str
     list_as_str = if String.starts_with?(list_as_str, ", "), do: String.slice(list_as_str, 2..-1), else: list_as_str
    "(" <> list_as_str <> ")"
  end

  defp stringify_namedarg({name, val}) do
    Atom.to_string(name) <> "=" <> stringify_variable(val)
  end
end
