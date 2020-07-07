use Mix.Config

# General configuration for Development environment
config :logger,
  backends: [:console],
  level: :error,
  format: "$date $time [$level] $metadata$message\n",
  metadata: [:user_id]
