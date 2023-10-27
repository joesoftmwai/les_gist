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

  def handle_event("validate", %{"gist" => params}, socket) do
    changeset =
      %Gist{}
      |> Gists.change_gist(params)
      |> Map.put(:action, :validate)
    {:noreply, assign(socket, :form, to_form(changeset))}
  end

  def handle_event("create", %{"gist" => params}, socket) do
    case Gists.create_gist(socket.assigns.current_user, params) do
      {:ok, _gist} ->
        changeset = Gists.change_gist(%Gist{})
        {:noreply, assign(socket, :form, to_form(changeset))}

      {:error, %Ecto.Changeset{} = changeset}
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end
end
