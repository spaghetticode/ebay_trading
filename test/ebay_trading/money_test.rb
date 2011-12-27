require 'test_helper'

class EbayTrading::MoneyTest < ActiveSupport::TestCase
  def setup
    node = Nokogiri.XML('<CurrentPrice currencyID="EUR">31.01</CurrentPrice>').at('CurrentPrice')
    @money = EbayTrading::Money.new(node)
    @null_money = EbayTrading::Money.new
  end

  test 'class is loaded' do
    assert_kind_of Class, EbayTrading::Money
  end

  test 'it should have expected currency_id' do
    assert_equal 'EUR', @money.currency_id
  end

  test 'it should have expected amount' do
    assert_equal 31.01, @money.amount
  end

  test 'it should return expected string' do
    assert_equal 'EUR 31.01', @money.to_s
  end

  test 'currency_id should be nil for a not valorized money object' do
    assert_nil @null_money.currency_id
  end

  test 'amount should be zero for a not valorized money object' do
    assert_equal 0, @null_money.amount.to_i
  end
end