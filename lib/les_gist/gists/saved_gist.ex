defmodule LesGist.Gists.SavedGist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "saved_gists" do

    # field :user_id, :id
    # field :gist_id, :id
    belongs_to :user, LesGist.Accounts.User
    belongs_to :gist, LesGist.Gists.Gist

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saved_gist, attrs) do
    saved_gist
    |> cast(attrs, [:user_id, :gist_id])
    |> validate_required([:user_id, :gist_id])
  end
end
