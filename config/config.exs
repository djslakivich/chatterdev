
use Mix.Config

# General application configuration
config :chatter,
  ecto_repos: [Chatter.Repo, Chatter.RepoTwo]

# Configures the endpoint
config :chatter, ChatterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wm+he1hK3KrGOXiKP1w7JZMstxGLpagnymvAGDl4LdMaZm2pLRsOAzvZ7BcjvVh1",
  render_errors: [view: ChatterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chatter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
