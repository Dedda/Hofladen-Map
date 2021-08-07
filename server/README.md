# Hofladen

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Ways to run this project

The default command to start project as phoenix server: `$ mix phx.server`. 
You can control which environment mix will use to build and run the project with the 
`MIX_ENV` environment variable.

Running an interactive Elixir shell in the project context (connects to database but doesn't
start the phoenix server): `$ iex -S mix`.

Running an interactive Elixir shell in the project context WITH starting the phoenix server:
`$ iex -S mix phx.server`.

Last but not least you might have noticed the `Dockerfile` and `docker-compose.yml` in this folder.
These make it possible to run the server with its own database in docker containers without any
additional configuration. Just run `$ docker-compose build` to build the images and then `$ docker-compose up`
 to start the containers (or `$ docker-compose up -d` to start them as daemons).
