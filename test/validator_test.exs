defmodule ValidatorTest do
  use ExUnit.Case
  alias Core.Validator

  doctest Core.Validator

  test "invalid url" do
    assert {:error, "wrong url"} == Validator.url("abc")
    assert {:error, "wrong url"} == Validator.url("www.google.com")
    assert {:error, "wrong url"} == Validator.url("http://")
  end

  test "valid url" do
    assert {:ok, %URI{}} = Validator.url("http://localhost/")
  end
end
