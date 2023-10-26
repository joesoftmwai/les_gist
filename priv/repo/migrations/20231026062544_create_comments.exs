defmodule LesGist.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :markup_text, :text
      add :user_id, references(:users, delete_all: :nothing)
      add :gist_id, references(:gists, delete_all: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:comments, [:user_id])
    create index(:comments, [:gist_id])
  end
end
