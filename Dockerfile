From elixir:1.11

RUN mix local.hex --force

COPY config ./config
COPY lib ./lib
COPY test ./test
COPY vendor ./vendor
COPY mix.exs .
COPY mix.lock .

RUN mix deps.get

ENTRYPOINT ["/bin/bash"]
