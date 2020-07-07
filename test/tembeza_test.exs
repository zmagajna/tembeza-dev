defmodule TembezaTest do
  use ExUnit.Case

  test "valid site should return links and images" do
    assert {:ok, %{assets: [], links: []}} == Tembeza.fetch("https://api.simple.com")
  end

  test "call on valid site should return links and images" do
    assert {:ok,
            %{
              assets: [
                "https://simplelink.com/img/new.jpg",
                "https://simplelink.com/img/new1.png",
                "https://simplelink.com/img/about.png"
              ],
              links: [
                "https://simplelink.com/about",
                "https://simplelink.com/contact",
                "https://simplelink.com/here"
              ]
            }} ==
             Tembeza.fetch("https://simple.com")
  end

  test "call on invalid site should return error" do
    assert {:error, "response not valid"} == Tembeza.fetch("https://non-existing.com")
  end
end
