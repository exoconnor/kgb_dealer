defmodule SpiderTest do
  use ExUnit.Case

  describe "parsing review entries" do
    # NOTE(connor): fragment collected 1/8/2021, this sort of test is going
    # to lose relevance as dealerrater updates their webpage
    test "extracts all fields" do
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
  end
end
