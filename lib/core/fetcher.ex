defmodule Core.Fetcher do
  @moduledoc """
  `Core.Fetcher` is a module that fetches data our from URL and returns.
  """

  @http_adapter Application.get_env(:tembeza, :http_adapter) || HTTPoison

  @doc """
  `make_request/1` is a function that makes request to the site
  and returns error or body.
  """
  @spec make_request(URI.t()) :: {:error, binary} | {:ok, binary}
  def make_request(url) do
    case @http_adapter.get(url) do
      {:ok, %HTTPoison.Response{status_code: status_code, body: body}}
      when status_code >= 200 and status_code < 300 ->
        {:ok, body}

      _ ->
        {:error, "response not valid"}
    end
  end
end
