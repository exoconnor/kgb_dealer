defmodule KgbDealer.Cli do
  def start() do
    Crawly.Engine.start_spider(KgbDealer.Spider)
    wait()
  end

  def wait() do
    case do_command() do
      :exit -> System.stop()
      _ -> wait()
    end
  end

  def do_command do
    read_command() |> evaluate()
  end

  def read_command do
    IO.gets(">")
    |> String.trim
    |> String.downcase
    |> String.split(" ", [trim: true])
  end

  def evaluate("q"), do: :exit
  def evaluate(_), do: :noop
end
