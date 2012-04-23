worker_processes 3
preload_app true
timeout 30

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
  Rails.cache.reset if Rails.cache.respond_to?(:reset)

  # Reset Rails's session store
  # If you know a cleaner way to find the session store instance, please let me know
  ObjectSpace.each_object(ActionDispatch::Session::DalliStore) { |obj| obj.reset }
end