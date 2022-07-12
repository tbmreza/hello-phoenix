defmodule HelloWeb.WhoamiView do
  use HelloWeb, :view

  def render("show.json", params) do
    %{software: software, ipaddress: ipaddress, language: language} = params

    %{
      ipaddress: ipaddress,
      language: language,
      software: software
    }
  end
end
