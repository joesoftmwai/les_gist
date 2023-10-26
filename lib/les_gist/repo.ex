defmodule LesGist.Repo do
  use Ecto.Repo,
    otp_app: :les_gist,
    adapter: Ecto.Adapters.Postgres
end
