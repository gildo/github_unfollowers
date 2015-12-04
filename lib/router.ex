defmodule GithubUnfollowers.Router do
  use Plug.Router

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug :match
  plug :dispatch

  Tentacat.start
  # Root path
  get "/" do
    send_resp(conn, 200, "go away please")
  end

  require EEx
  EEx.function_from_file :defp, :template, "templates/user.eex", [:assigns]

  get "/:user" do
    user = Tentacat.Users.find(user)
    send_resp conn, 200, template(user: user)
  end

end
