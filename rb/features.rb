# Hypixel SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module HypixelFeatures
  def self.make_feature(name)
    case name
    when "base"
      HypixelBaseFeature.new
    when "ratelimit"
      HypixelRatelimitFeature.new
    when "retry"
      HypixelRetryFeature.new
    when "test"
      HypixelTestFeature.new
    when "timeout"
      HypixelTimeoutFeature.new
    else
      HypixelBaseFeature.new
    end
  end
end
