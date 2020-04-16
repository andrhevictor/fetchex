# Fetchex

## To start the Phoenix server:

If you want to be inside the container:
  * Run the container, exposing its ports `docker-compose run --rm --service-ports elixir bash`
  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Or

  * Install dependencies with `docker-compose run --rm api mix deps.get` 
  * Start Phoenix endpoint with `docker-compose up`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

You can pass the variables via GET query parameters:
`http://localhost:4000/?url=https://hexdocs.pm/floki/0.26.0/Floki.html`

Or via POST on `http://localhost:4000` with the following body:
```json
{
  "url": "https://hexdocs.pm/floki/0.26.0/Floki.html"
}
```

## To run the tests:

If you want to be inside the container:
  * Run the container, exposing its ports `docker-compose run --rm --service-ports elixir bash`
  * Run the tests `mix test`

Or

  * Run the tests `docker-compose run --rm api mix test` 

To see the coverage, just replace `mix test` for `mix coveralls` or `mix coveralls.html`.