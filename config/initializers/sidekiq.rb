Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/12' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/12' }
end

Sidekiq.default_worker_options = { 'backtrace' => 10 } # number of lines of backtrace

Sidekiq.configure_server do |config|
  # runs after your app has finished initializing but before any jobs are dispatched.
  config.on(:startup) do
    make_some_singleton
  end
  config.on(:quiet) do
    puts "Got USR1, stopping further job processing..."
  end
  config.on(:shutdown) do
    puts "Got TERM, shutting down process..."
    stop_the_world
  end
end
