defmodule Followers do
  def iterate_followers(user, followers) do
    if user == nil do
      user = create_user user["login"]
    end

    for follower <- followers, do: do_things(follower, user)
  end

  def do_things(follower, followed) do
    user = Repo.get_by User, username: follower["login"]
    if user == nil, do: {_, user} = create_user follower["login"]

    create_relation user, followed
  end

  def create_user(user) do
    user = Repo.insert %User{username: user}
    user
  end

  def create_relation(follower, following) do
    relation = Repo.get_by Relation, follower_id: follower.id, followed_id: following.id
    if relation == nil do
      Repo.insert %Relation{follower_id: follower.id, followed_id: following.id}
    end
  end
end
