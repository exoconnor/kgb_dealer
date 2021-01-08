defmodule KgbDealer.Top do
  @moduledoc """
  Agent to store most extremely postive reviews
  What do the top 3 contenders in an event stand on?
  I think calling my module that is against the spec unfortunately
  """
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def show do
    Agent.get(__MODULE__, & &1)
  end

  # Maintain top 3 by sorting a bunch of 6 element lists
  def merge(contenders) do
    Agent.update(__MODULE__, fn top ->
      top ++ contenders
      |> Enum.sort_by(fn x -> x[:score] end, :desc)
      |> Enum.take(3)
    end)
  end
end
