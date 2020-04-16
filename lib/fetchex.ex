defmodule Fetchex do
  @moduledoc """
  Fetchex fetches your desired URL and return all the links that the page have.
  """

  alias Fetchex.HTMLParser
  alias Fetchex.HTTP

  @doc """
  Fetches the given url and get the links of the tags `<a>` and `<img>`.

  Returns a tuple `{:ok, map}` when succeed, or `{:error, reason}` if anything bad happen.
  """
  @spec fetch(String.t()) :: {atom(), map()}
  def fetch(url) do
    with {:ok, html} <- HTTP.get_html(url),
         {:ok, html_tree} <- HTMLParser.parse_document(html) do

      links =
        html_tree
        |> HTMLParser.get_attribute_from_tag("href", "a")
        |> Enum.map(&fix_url(url, &1))

      assets =
        html_tree
        |> HTMLParser.get_attribute_from_tag("src", "img")
        |> Enum.map(&fix_url(url, &1))

      map = %{
        assets: assets,
        links: links
      }

      {:ok, map}
    else
      err -> err
    end
  end

  defp fix_url(main_url, partial) do
    partial
    |> case do
      "http" <> _rest -> partial
      "#" <> _rest -> main_url <> partial
      str ->
        if str =~ ".html" do
          main_url
          |> String.split("/")
          |> List.update_at(-1, fn _last_str -> str end)
          |> Enum.join("/")
        end
    end
  end
end
