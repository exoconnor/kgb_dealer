defmodule KgbDealer do
  @moduledoc """
  Documentation for `KgbDealer`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> KgbDealer.hello()
      :world

  """
  def start(_type, _args) do
    Supervisor.start_link([], strategy: :one_for_one)
  end
end
