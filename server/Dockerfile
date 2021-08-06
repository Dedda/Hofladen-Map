FROM elixir:latest

RUN apt-get update && \
    apt-get install -y postgresql-client npm inotify-tools

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force

RUN mix do compile

WORKDIR /app/assets
RUN npm install

WORKDIR /app
CMD ["/app/entrypoint.sh"]