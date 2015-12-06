defmodule GithubUnfollowers.Router do
  use Plug.Router

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "go away please")
  end

  require EEx
  EEx.function_from_file :defp, :template, "templates/user.eex", [:assigns]


  get "/:user" do
    # client = Tentacat.Client.new
    # followers = Tentacat.Users.Followers.followers user, client
    # user = Tentacat.Users.find(user)
    user = User |> User.with_followers |> Repo.get_by username: user
    # Followers.iterate_followers user, followers

    Repo.preload user, :followers
    followers = Repo.all Ecto.Model.assoc(user, :followers)

    send_resp conn, 200, template(user: user, followers: followers)
  end

end
