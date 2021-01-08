defmodule KgbDealer.Spider do
  use Crawly.Spider

  alias Crawly.Utils

  @impl Crawly.Spider
  def base_url(), do: "https://www.dealerrater.com"

  @impl Crawly.Spider
  def init() do
    [
      start_urls: [
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page1/"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)

    # Extract next page from the "next" button
    requests = document
    |> Floki.find("div.next")
    |> Floki.attribute("a", "href")
    |> Utils.build_absolute_urls(base_url())
    |> Utils.requests_from_urls()

    # Extract review entries
    reviews = document
    |> Floki.find("div.review-entry")
    |> Enum.map(fn review -> KgbDealer.Review.from_floki(review) end)

    %Crawly.ParsedItem{
      :requests => requests,
      :items => [%{page: response.request_url reviews: reviews}]
    }
  end
end
