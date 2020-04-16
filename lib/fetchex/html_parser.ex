defmodule Fetchex.HTMLParser do
  @moduledoc """
  Parse HTML documents and query its content.
  """

  @spec parse_document(String.t()) :: {tuple(), list()}
  def parse_document(document) do
    Floki.parse_document(document)
  end

  @spec get_attribute_from_tag(list(), String.t(), String.t()) :: list()
  def get_attribute_from_tag(document, attr_name, tag) do
    document
    |> Floki.find(tag)
    |> get_attribute_value(attr_name)
  end

  @spec get_attribute_value(list(), String.t()) :: list()
  defp get_attribute_value(nodes, attribute) do
    nodes
    |> Enum.flat_map(fn {_, attributes, _} -> attributes end)
    |> Enum.filter(fn {attr_name, _value} -> attr_name == attribute end)
    |> Enum.map(fn {_name, value} -> value end)
  end
end
