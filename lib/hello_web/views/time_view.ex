defmodule HelloWeb.TimeView do
  use HelloWeb, :view

  def render("show.json", %{stamp: stamp}) do
    # NOTE stamp = 1451001600 (unix) ok.
    # TODO stamp = "2015-12-25", add unittest?
    with {:ok, dt, _} <- DateTime.from_iso8601(stamp),
         unix <- DateTime.to_string(dt) do
      %{data: %{unix: unix, utc: stamp}}
    else
      _ ->
        with {parsed, _} <- Integer.parse(stamp),
             {:ok, v} <- DateTime.from_unix(parsed) do
          %{data: %{utc: DateTime.to_string(v), unix: parsed}}
        else
          _ ->
            %{data: %{error: "Invalid Date"}}
        end
    end
  end
end
