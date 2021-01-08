defmodule SpiderTest do
  use ExUnit.Case

  describe "parsing reviews html" do
    # NOTE(connor): fragment collected 1/8/2021, this sort of test is going
    # to lose relevance as dealerrater updates their webpage
    test "extracts all fields from a review" do
      fragment = File.read!("test/fixtures/review-entry.html")

      entry = fragment
      |> Floki.parse_fragment!()
      |> Floki.find("div.review-entry")
      |> KgbDealer.Review.from_floki()

      assert entry.id == "r7731699"
      assert entry.date == "December 30, 2020"
      assert entry.body == "Test review body"
      assert entry.reviewer == "connor"
    end

    test "extracts all reviews from a page" do
      start_supervised(KgbDealer.CountingSpiders)
      html = File.read!("test/fixtures/reviews-page.html")
      mock_response = %HTTPoison.Response{body: html, request_url: "test/fixtures/reviews-page.html"}
      parsed = KgbDealer.Spider.parse_item(mock_response)

      assert Enum.count(parsed.requests) == 1
      assert Enum.count(Map.get(List.first(parsed.items), :reviews, [])) == 10
    end
  end
end
