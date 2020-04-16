defmodule Fetchex.Repo do
  use Ecto.Repo,
    otp_app: :fetchex,
    adapter: Ecto.Adapters.Postgres
end
