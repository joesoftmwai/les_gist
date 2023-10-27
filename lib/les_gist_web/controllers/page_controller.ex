defmodule LesGistWeb.PageController do
  use LesGistWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.

    # render(conn, :home)
    redirect(conn, to: "/create")
  end
end
