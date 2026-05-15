# Hypixel SDK exists test

require "minitest/autorun"
require_relative "../Hypixel_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = HypixelSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
