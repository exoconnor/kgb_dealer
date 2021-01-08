defmodule KgbDealer.CrawlyPipes.ExtractMaximalPositivity do
  @moduledoc """
  Crawly pipeline to score sentiment on reviews
  """

  @behaviour Crawly.Pipeline

  @impl Crawly.Pipeline
  def run(item, state, _opt \\ []) do
    top3 = item[:reviews]
    |> Enum.map(fn review -> %{review: review, score: Veritaserum.analyze(review.body)} end)
    |> Enum.sort_by(fn x -> x[:score] end, :desc)
    |> Enum.take(3)

    KgbDealer.Top.merge(top3)
    if item[:status] == :exit do
      KgbDealer.Application.finish()
      {item, state}
    else
      {item, state}
    end
  end
end
