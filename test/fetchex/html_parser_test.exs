defmodule Fetchex.HTMLParserTest do
  use ExUnit.Case, async: true

  alias Fetchex.HTMLParser

  @sample_html """
  <!DOCTYPE html>
  <html>

  <body>
    <div>
      <p>Hello</p>
    </div>
  </body>

  </html>
  """

  describe "get_attribute_from_tag/3" do
    test "success" do
      document = [
        {"a", [{"href", "example1"}], []},
        {"a", [{"href", "example2"}], []},
        {"img", [{"href", "example3"}], []}
      ]

      ["example1", "example2"] = HTMLParser.get_attribute_from_tag(document, "href", "a")
    end
  end

  describe "parse_document/1" do
    test "success" do

      {:ok, html_tree} = HTMLParser.parse_document(@sample_html)

      assert html_tree == [{"html", [], [{"body", [], [{"div", [], [{"p", [], ["Hello"]}]}]}]}]
    end
  end
end
