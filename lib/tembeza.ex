defmodule Tembeza do
  @moduledoc """
  Documentation for module `Tembeza`.
  """
  require Logger
  alias Core.{Validator, Fetcher}

  @doc """
  `fetch/1` is a function that returns links and images map for the url provided.

  ## Examples

      iex> Tembeza.fetch("https://www.tembeza.com")
      {:ok,
        %{
          assets: ["https://www.tembeza.com/wp-content/uploads/2019/07/symbol.png",
            "https://www.tembeza.com/wp-content/uploads/2019/07/products.png",
            "https://www.tembeza.com/wp-content/uploads/2019/07/about-us.png"],
          links: ["https://www.tembeza.com/", "#home", "#product", "#services",
            "#careers", "#about", "#contact", "#contact", "/cdn-cgi/l/email-protection",
            "#contact", "/cdn-cgi/l/email-protection",
            "https://www.linkedin.com/company/tembeza-international/",
            "/cdn-cgi/l/email-protection"]
        }}

  """
  def fetch(url) do
    with {_module_function, {:ok, url_schema}} <- {"Validator.url/1", Validator.url(url)},
         {_module_function, {:ok, body}} <-
           {"Fetcher.make_request/1", Fetcher.make_request(url_schema)},
         {_module_function, {:ok, document}} <-
           {"Floki.parse_document/1", Floki.parse_document(body)},
         {_module_function, images} <- {"get_images/1", get_images(document)},
         {_module_function, links} <- {"get_links/1", get_links(document)} do
      {:ok, %{assets: images, links: links}}
    else
      {module_function, {:error, reason} = response} ->
        Logger.error("[#{module_function}] Has a problem #{reason}")
        response
    end
  end

  # TODO: Check what happens if multiple images
  def get_images(data) do
    data
    |> Floki.find("img")
    |> Floki.attribute("src")
  end

  # TODO: Check what happens if multiple links
  def get_links(data) do
    data
    |> Floki.find("a")
    |> Floki.attribute("href")
  end
end
