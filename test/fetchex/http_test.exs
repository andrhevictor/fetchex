defmodule Fetchex.HTTPTest do
  use ExUnit.Case, async: true

  alias Fetchex.HTTP

  describe "get_html/1" do
    test "success" do
      assert {:ok, html} = HTTP.get_html("www.google.com")
      assert is_bitstring(html)
    end

    test "error - non existing domain" do
      assert {:error, :nxdomain} = HTTP.get_html("www.non_existent_domain.com")
    end
  end
end
