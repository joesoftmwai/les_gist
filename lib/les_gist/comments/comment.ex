defmodule LesGist.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :markup_text, :string
    belongs_to :user, LesGist.Accounts.User # field :user_id, :id
    belongs_to :gist, LesGist.Gists.Gist    # field :gist_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:markup_text, :user_id, :gist_id])
    |> validate_required([:markup_text, :user_id, :gist_id])
  end
end
