defmodule KgbDealer.CountingSpiders do
  @moduledoc """
  Agent to track number of pages crawled since Crawly seems to track end of pipeline
  """
  use Agent

  @max_crawl 5

  def start_link(_) do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

  def continue? do
    Agent.get(__MODULE__, fn c -> c < @max_crawl end)
  end

  def update(x) do
    Agent.update(__MODULE__, fn c -> c + x end)
  end
end
