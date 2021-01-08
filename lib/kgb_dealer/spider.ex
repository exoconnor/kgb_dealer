defmodule KgbDealer.Spider do
  use Crawly.Spider
  alias Crawly.Utils

  @impl Crawly.Spider
  def base_url(), do: "https://www.dealerrater.com"

  @impl Crawly.Spider
  def init() do
    [
      start_urls: [
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page1/",
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    IO.inspect("Crawling: #{response.request_url}")
    {:ok, document} = Floki.parse_document(response.body)

    requests = make_requests(document)
    KgbDealer.CountingSpiders.update(Enum.count(requests))

    # Extract review entries (this could be done in a pipeline)
    reviews = document
    |> Floki.find("div.review-entry")
    |> Enum.map(fn review -> KgbDealer.Review.from_floki(review) end)

    # Once we've crawled sufficient pages put the :exit/:halt command in the pipe
    if KgbDealer.CountingSpiders.continue? do
      %Crawly.ParsedItem{
        :requests => requests,
        :items => [%{page: response.request_url, reviews: reviews}]
      }
    else
      %Crawly.ParsedItem{
        :requests => [],
        :items => [%{page: response.request_url, reviews: reviews, status: :exit}]
      }
    end
  end

  # Extract next page from the "next" button
  defp make_requests(document) do
      document
      |> Floki.find("div.next")
      |> Floki.attribute("a", "href")
      |> Utils.build_absolute_urls(base_url())
      |> Utils.requests_from_urls()
  end
end
