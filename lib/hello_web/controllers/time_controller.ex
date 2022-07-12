defmodule HelloWeb.TimeController do
  use HelloWeb, :controller

  def show(conn, %{"stamp" => stamp}) do
    render(conn, "show.json", stamp: stamp)
  end
end
