defmodule Fetchex.HTTP do
  @moduledoc """
  Wrapper to handle HTTP Requests.
  """

  @doc """
  Sends a `GET` to the given URL and returns its body.
  """
  def get_html(url) do
    url
    |> HTTPoison.get()
    |> get_body()
  end

  defp get_body({:ok, %HTTPoison.Response{body: body}}) do
    {:ok, body}
  end

  defp get_body({:error, %HTTPoison.Error{} = error}), do: {:error, error.reason}

end
