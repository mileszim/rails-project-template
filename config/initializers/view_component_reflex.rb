ViewComponentReflex::Engine.configure do |config|
  config.state_adapter = ViewComponentReflex::StateAdapter::Redis.new(
    redis_opts: {
      url: ENV.fetch("REDIS_VIEW_COMPONENT_URL") { "redis://localhost:6379/3" },
      driver: :hiredis
    },
    ttl: 3600
  )
end
