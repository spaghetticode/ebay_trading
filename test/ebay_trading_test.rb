require 'test_helper'

class EbayTradingTest < ActiveSupport::TestCase
  test 'module is loaded' do
    assert_kind_of Module, EbayTrading
  end

  test 'it should have EBAY_SITES constant' do
    assert EbayTrading::EBAY_SITES
  end

  test 'it should have EBAY_SITE_CODES constant' do
    assert EbayTrading::EBAY_SITE_CODES
  end
end
