defmodule GithubUnfollowers.User do
  use Ecto.Schema
  schema "users" do
    field :username
    has_many :followers, GithubUnfollowers.Relations, foreign_key: :followed_id, on_delete: :fetch_and_delete
    has_many :following,   GithubUnfollowers.Relations, foreign_key: :follower_id, on_delete: :fetch_and_delete

    timestamps
  end
end

defmodule GithubUnfollowers.Relations do
  use Ecto.Schema
  schema "relations" do
    belongs_to :followed, GithubUnfollowers.User
    belongs_to :follower, GithubUnfollowers.User

    timestamps
  end
end
