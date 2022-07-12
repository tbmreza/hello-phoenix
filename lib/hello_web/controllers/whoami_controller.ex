defmodule HelloWeb.WhoamiController do
  use HelloWeb, :controller

  def show(conn, _params) do
    remote_ip = conn.remote_ip |> :inet.ntoa() |> to_string()
    accept_language = conn |> get_req_header("accept-language") |> to_string
    user_agent = conn |> get_req_header("user-agent") |> to_string

    render(conn, "show.json",
      ipaddress: remote_ip,
      language: accept_language,
      software: user_agent
    )
  end
end
