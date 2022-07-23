require "sidekiq"

redis_url = ENV["REDIS_URL"]

Sidekiq.configure_client do |config|
  # INFO: Rails app usually needs one connection to redis
  config.redis = { url: redis_url, size: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }
end
