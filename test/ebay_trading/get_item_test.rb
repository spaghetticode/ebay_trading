# coding: utf-8

require 'test_helper'

class EbayTrading::GetItemTest < ActiveSupport::TestCase
  def setup
    @id   = '14624350'
    @item = EbayTrading::GetItem.new(@id)
    @item.stubs(:xml_response).returns(nokogiri_xml_from('get_item.xml'))
  end

  test 'should have expected current_price' do
    assert_equal 'EUR 31.01', @item.current_price.to_s
  end

  test 'should have expected title' do
    assert_equal 'seltenes SABA Freudenstadt 8 Röhrenradio guter Zustand', @item.title
  end

  test 'should have expected custom_xml' do
    assert_equal "<ItemID>#{@id}</ItemID>", @item.custom_xml
  end

  test 'should have expected final_price' do
    assert_equal 'EUR 31.01', @item.final_price.to_s
  end

  test 'should have expected url' do
    assert_equal 'http://cgi.ebay.de/ws/eBayISAPI.dll?ViewItem&item=260669206334&category=113431', @item.url
  end

  test 'should have expected minimum_to_bid' do
    assert_equal 'EUR 31.51', @item.minimum_to_bid.to_s
  end

  test 'should have expected bids count' do
    assert_equal 12, @item.bids_count
  end

  test 'should have expected final_price_in_usd' do
    assert_equal 'USD 42.63', @item.final_price_in_usd.to_s
  end

  test 'should have expected gallery_url' do
    assert_equal "http://thumbs3.ebaystatic.com/pict/#{@id}.jpg", @item.gallery_url
  end

  test 'should have expected country' do
    assert_equal 'DE', @item.country
  end

  test 'should have expected site_code' do
    assert_equal 'DE', @item.site_code
  end

  test 'should have expected seller_ebay_id' do
    assert_equal 'ceyenneblue', @item.seller_ebay_id
  end
end
