# Initialize Sidekiq
require 'uri'

conf = Rails.application.config_for(:sidekiq).symbolize_keys

redis_uri = URI(conf[:redis_uri])
redis_uri.scheme = 'redis'
redis_uri.path = '/12'
redis_uri = redis_uri.to_s

Rails.logger.debug "Redis URI: #{redis_uri}"

Sidekiq.configure_server do |config|
  config.redis = { url: redis_uri }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_uri }
end
