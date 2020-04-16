defmodule FetchexTest do
  use ExUnit.Case, async: true

  describe "fetch/1" do
    test "Fetchs sucessfuly" do
      url = "https://hexdocs.pm/floki/0.26.0/Floki.html"
      second_link = "https://hexdocs.pm/floki/0.26.0/Floki.html#full-list"

      assert {:ok, result} = Fetchex.fetch(url)

      assert is_map(result)
      assert is_list(result.assets)
      assert is_list(result.links)

      assert Enum.empty?(result.assets)
      assert Enum.at(result.links, 1) == second_link
    end

    test "Fetchs a non existing domain" do
      url = "https://non_existing_website.com"

      assert {:error, :nxdomain} = Fetchex.fetch(url)
    end
  end
end
