# KgbDealer

This is an application that:
- Scrapes the first 5 pages of reviews for McKaig Chevrolet Buick off of DealerRater.com
- Score "positivity" of reviews 
- Log the top three most "overly positive" reviews to console, in order of severity

Positivity is determined by AFINN-165 sentiment analysis - this scores based on valence of common words and phrases.



## Installation

If you have elixir and erlang installed all it takes is `mix deps.get`
```
> mix deps.get
> mix
```

For tests
```
mix test
```

If you find yourself without Elixir, the Dockerfile provides bare minimum functionality
```
docker build -t kgb_dealer .
docker run -it kgb_builder

docker-shell>mix test
docker-shell>mix run
```

## Notes
- Crawler is SLOW, each worker is pretty heavily rate limited to be polite, and it's not currently running
in parallel
