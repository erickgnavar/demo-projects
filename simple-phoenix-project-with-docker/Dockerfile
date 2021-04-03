FROM elixir:1.11-alpine as build

ENV MIX_ENV=prod

# install build dependencies
RUN apk --update add nodejs npm git build-base

WORKDIR /app

# setup hex + rebar
RUN mix local.hex --force && mix local.rebar --force

# install mix dependencies
COPY mix.exs .
COPY mix.lock .
COPY config config

RUN mix do deps.get --only=prod, compile

COPY priv priv
COPY assets assets

# build assets
RUN cd assets && npm install && npm run deploy
RUN mix phx.digest

# build project
COPY lib lib
RUN mix compile

# copy all the scripts to be executed when the release start
COPY rel rel

RUN mix release

FROM alpine:3.9

RUN apk add --update bash openssl

WORKDIR /rel

COPY --from=build /app/_build/prod/rel/ .

CMD /rel/demo/bin/demo start
