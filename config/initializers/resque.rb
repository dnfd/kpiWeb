Rails.application.config.to_prepare do
  redis_resque = Redis.new(url: 'redis://0.0.0.0:6379')
  Resque.redis = redis_resque
end
