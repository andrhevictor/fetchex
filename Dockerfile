FROM elixir:1.10.2

RUN mix local.hex --force && mix local.rebar --force

# RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
# RUN apt install nodejs