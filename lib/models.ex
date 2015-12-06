defmodule User do
  use Ecto.Schema
  use Ecto.Model

  schema "users" do
    field :username
    has_many :relations,         Relation, foreign_key: :followed_id, on_delete: :fetch_and_delete
    has_many :inverse_relations, Relation, foreign_key: :follower_id, on_delete: :fetch_and_delete

    timestamps
  end

  def with_followers(query) do
    from q in query, preload: [:followers]
  end
end

defmodule Relation do
  use Ecto.Schema
  schema "relations" do
    has_many :users, User
    belongs_to :followed, User
    belongs_to :follower, User

    timestamps
  end
end
