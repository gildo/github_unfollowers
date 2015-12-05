defmodule GithubUnfollowers.Repo.Migrations.AddRelationsTable do
  use Ecto.Migration

  def up do
    create table(:relations) do
      add :follower_id, references(:users)
      add :followed_id, references(:users)

      timestamps
    end
  end

  def down do
    drop table(:relations)
  end

end
