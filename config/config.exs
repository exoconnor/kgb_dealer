import Config

config :crawly,
  closespider_itemcount: 5, # Insufficient - I believe the pipeline still has to clear throwing off count
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.UniqueRequest,
    {Crawly.Middlewares.UserAgent, user_agents: ["Crawly (The Itsy Bitsy Spider, like Gecko)"]}
  ],
  pipelines: [
    KgbDealer.CrawlyPipes.ExtractMaximalPositivity
  ]
if config_env() == :test do
  # TODO(connor)
end
