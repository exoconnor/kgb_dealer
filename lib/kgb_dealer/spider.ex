defmodule KgbDealer.Spider do
  use Crawly.Spider

  alias Crawly.Utils

  @impl Crawly.Spider
  def base_url(), do: "https://www.dealerrater.com"

  @impl Crawly.Spider
  def init() do
    [
      # QUESTION(connor): Is it still a crawler if you manually entered all the URLs?
      start_urls: [
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page1/",
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page2/",
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page3/",
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page4/",
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page5/"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)

    reviews = document
    |> Floki.find("div.review-entry")
    |> Enum.map(fn review -> KgbDealer.Review.from_floki(review) end)
    |> IO.inspect

    %Crawly.ParsedItem{
      :requests => [],
      :items => reviews
    }
  end
end
