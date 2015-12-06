defmodule Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def up do
    create table(:users) do
      add :username, :string
      timestamps
    end
  end

  def down do
    drop table(:users)
  end
end
