# Hypixel SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module HypixelFeatures
  def self.make_feature(name)
    case name
    when "base"
      HypixelBaseFeature.new
    when "test"
      HypixelTestFeature.new
    else
      HypixelBaseFeature.new
    end
  end
end
