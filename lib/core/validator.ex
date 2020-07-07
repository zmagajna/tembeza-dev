defmodule Core.Validator do
  @moduledoc """
  `Core.Validate` is a module that deals with the validation
  functionalities inside our Application.
  """

  @doc """
  `url/1` is a function that checks if the url that
  was provided by user is ok or not. Assumption here is
  that user always provide the schema of the URL(http, https).

  ## Examples

        iex> Core.Validator.url("https://google.com")
        {:ok,
          %URI{
            authority: "google.com",
            fragment: nil,
            host: "google.com",
            path: nil,
            port: 443,
            query: nil,
            scheme: "https",
            userinfo: nil
          }}
  """
  @spec url(binary | URI.t()) :: {:error, binary} | {:ok, URI.t()}
  def url(url) do
    case URI.parse(url) do
      %URI{scheme: nil, host: nil} ->
        {:error, "wrong url"}

      %URI{scheme: nil} ->
        {:error, "wrong url"}

      %URI{host: ""} ->
        {:error, "wrong url"}

      uri ->
        {:ok, uri}
    end
  end
end
