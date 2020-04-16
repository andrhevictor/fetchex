defmodule FetchexWeb.IndexController do
  use FetchexWeb, :controller

  def index(conn, params) do
    with %{"url" => url} <- params,
    {:ok, map} <- Fetchex.fetch(url) do

      conn
      |> json(map)
    else
      {:error, reason} ->
        conn
        |> put_status(:expectation_failed)
        |> json(%{error: true, reason: reason})

      %{} ->
        conn
        |> put_status(:expectation_failed)
        |> json(%{error: true, reason: "missing_url_param"})
    end
  end
end
