defmodule FetchexWeb.IndexControllerTest do
  use FetchexWeb.ConnCase

  describe "GET /" do
    test "Missing URL", %{conn: conn} do
      conn = get(conn, "/")

      assert %{"error" => true, "reason" => "missing_url_param"} = json_response(conn, 417)
    end

    test "Non existing domain", %{conn: conn} do
      conn =
        conn
        |> put_req_header("content-type", "application/json")
        |> get("/", url: "www.non_existent_domain.com")

      assert %{"error" => true, "reason" => "nxdomain"} = json_response(conn, 417)
    end

    test "Fetchs the content sucessfuly", %{conn: conn} do
      conn =
        conn
        |> put_req_header("content-type", "application/json")
        |> get("/", url: "https://hexdocs.pm/floki/0.26.0/Floki.html")

      assert json_response(conn, 200)
    end
  end

  describe "POST /" do
    test "Missing URL", %{conn: conn} do
      conn = post(conn, "/")

      assert %{"error" => true, "reason" => "missing_url_param"} = json_response(conn, 417)
    end

    test "Non existing domain", %{conn: conn} do
      conn =
        conn
        |> put_req_header("content-type", "application/json")
        |> post("/", url: "www.non_existent_domain.com")

      assert %{"error" => true, "reason" => "nxdomain"} = json_response(conn, 417)
    end

    test "Fetchs the content sucessfuly", %{conn: conn} do
      conn =
        conn
        |> put_req_header("content-type", "application/json")
        |> post("/", url: "https://hexdocs.pm/floki/0.26.0/Floki.html")

      assert json_response(conn, 200)
    end
  end
end
