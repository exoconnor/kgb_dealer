defmodule KgbDealer.Application do

  use Application

  def start(_type, _args) do
    children = [
      {KgbDealer.Top, []},
      {KgbDealer.CountingSpiders, []},
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
    KgbDealer.Cli.start()
  end

  def finish do
    IO.inspect(KgbDealer.Top.show())
    IO.inspect("FIN")
    System.stop(0)
  end
end
