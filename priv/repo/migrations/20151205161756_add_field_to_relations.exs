defmodule Repo.Migrations.AddFieldToRelations do
  use Ecto.Migration

  def change do
    alter table(:relations) do
      add :unfollowed, :boolean, default: false, null: false
    end
  end
end
