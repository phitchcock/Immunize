Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redistogo:deb0795a4ea5425a8f490bda57a8c3db@grouper.redistogo.com:10425/' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redistogo:deb0795a4ea5425a8f490bda57a8c3db@grouper.redistogo.com:10425/' }
end