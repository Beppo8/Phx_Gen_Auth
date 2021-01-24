defmodule AuthWeb.PageController do
  use AuthWeb, :controller

  import AuthWeb.UserAuth, only: [require_authenticated_user: 2]

  plug :require_authenticated_user when action not in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
