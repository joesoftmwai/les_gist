defmodule LesGistWeb.CreateGistLive do
  use LesGistWeb, :live_view
  import Phoenix.HTML.Form

  # alias LesGist.Gists
  # alias LesGist.Gists.Gist
  alias LesGist.{Gists, Gists.Gist}

  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        form: to_form(Gists.change_gist(%Gist{}))
      )

    {:ok, socket}
  end

  # use this if its short
  # def render(assigns) do
  #   ~H"""

  #   """
  # end
end
