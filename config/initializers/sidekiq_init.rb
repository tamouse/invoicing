# Initialize Sidekiq
require 'uri'

conf = Rails.application.config_for(:sidekiq).symbolize_keys
redis_uri = "redis://#{conf[:redis_host]}:#{conf[:redis_port]}/12"
Rails.logger.debug "Redis URI: #{redis_uri}"

Sidekiq.configure_server do |config|
  config.redis = { url: redis_uri }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_uri }
end
