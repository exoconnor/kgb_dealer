defmodule KgbDealer.Review do
  @moduledoc """
  A review entry for a dealership.

  NOTE(connor): It seems like it would be cool to draw 'positivity' score from both star
  ratings and the sentiment analysis. Star ratings for both employees and the dealership
  are displayed by using a classname to translate a background image (this is how spritesheets
  work I believe.) Could extract by reading classnames (rating-xx where xx are digits giving score
  out of 50), however, it's unclear how that would be weighed against an arbitrary sentiment
  analysis score without having someone train a classifier.
  """

  alias __MODULE__

  defstruct [
    id: "",
    date: "",
    body: "",
    reviewer: ""
  ]

  def from_floki(floki) do
      %Review{
        id: pluck_id(floki),
        date: pluck_date(floki),
        body: pluck_body(floki),
        reviewer: pluck_reviewer(floki)
      }
  end

  defp pluck_id(floki) do
    floki
    |> Floki.attribute("a", "name")
    |> List.first
  end

  defp pluck_date(floki) do
    floki
    |> Floki.find("div.review-date > div:first-child")
    |> Floki.text([deep: false])
  end

  defp pluck_body(floki) do
    floki
    |> Floki.find("p.review-content")
    |> Floki.text([deep: false])
  end

  defp pluck_reviewer(floki) do
    floki
    |> Floki.find("span.italic.font-18.black.notranslate")
    |> Floki.text([deep: false])
    |> String.slice(2..-1)
  end
end
