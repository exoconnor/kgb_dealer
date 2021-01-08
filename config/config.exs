import Config

config :crawly,
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.UniqueRequest,
    {Crawly.Middlewares.UserAgent, user_agents: ["Crawly (The Itsy Bitsy Spider, like Gecko)"]}
  ]
if config_env() == :test do
  IO.puts("Env is test in test branch")
else
  IO.puts("Env is #{config_env()}")
end
