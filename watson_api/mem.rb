require "redis"

module WatsonApi
  class Mem
    include Singleton

    def initialize
      @redis = Redis.new(:host => 'localhost', :port => 6379)
    end

    def get(key)
      @redis.get(key)
    end

    def set(key, value)
      @redis.set(key, value)
    end
  end
end
