require 'test_helper'

class EbayTrading::ConfigTest < ActiveSupport::TestCase
  test 'should load config' do
    assert EbayTrading::Config.send(:class_variable_get, '@@config')
  end

  test 'should return config values' do
    %w[dev_name app_name cert_name auth_token url].each do |method|
      assert EbayTrading::Config.send(method)
    end
  end
end