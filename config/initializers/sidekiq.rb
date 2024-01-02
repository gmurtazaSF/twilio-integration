# frozen_string_literal: true

require 'sidekiq'

redis_host = ENV.fetch('REDIS_URL') { 'redis://127.0.0.1:6379/0' }

Sidekiq.configure_server do |config|
  config.redis = { url: redis_host }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_host }
end
