host = Rails.env.test? ? "localhost" : "redis"
$redis = Redis.new(:host => host, :port => 6379)
