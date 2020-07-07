defmodule Core.Http.Mock do
  @moduledoc false

  def get(%URI{host: "api.simple.com", scheme: "https"}) do
    {:ok,
     %HTTPoison.Response{
       body: "{\"content\":\"no content\"}",
       status_code: 200
     }}
  end

  def get(%URI{host: "simple.com", scheme: "https"}) do
    {:ok,
     %HTTPoison.Response{
       body: """
       <html>
       <a href=\"https://simplelink.com/about\">About</a>
       <a href=\"https://simplelink.com/contact\">Contact</a>
       <a href=\"https://simplelink.com/here\">Here</a>
       <img src=\"https://simplelink.com/img/new.jpg\">
       <img src=\"https://simplelink.com/img/new1.png\">
       <img src=\"https://simplelink.com/img/about.png\">
       </html>
       """,
       status_code: 200
     }}
  end

  def get(%URI{host: "non-existing.com", scheme: "https"}) do
    {:error, %HTTPoison.Error{id: nil, reason: :nxdomain}}
  end
end
