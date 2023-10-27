defmodule LesGist.Gists.Gist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gists" do
    field(:description, :string)
    field(:markup_text, :string)
    field(:name, :string)
    belongs_to(:user, LesGist.Accounts.User)
    has_many(:comment, LesGist.Comments.Comment)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(gist, attrs) do
    gist
    |> cast(attrs, [:name, :description, :markup_text, :user_id])
    |> validate_required([:name, :description, :user_id])
  end
end
