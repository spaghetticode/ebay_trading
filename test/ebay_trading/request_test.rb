require 'test_helper'

class EbayTrading::RequestTest < ActiveSupport::TestCase
  def setup
    @call_name = EbayTrading::CallName.new
    @call_name.stubs(:custom_xml).returns('')
    @request = EbayTrading::Request.new(@call_name)
  end

  test 'request headers should be a hash' do
    assert_instance_of Hash, @request.headers
  end

  test 'request payload should be a string' do
    assert_instance_of String, @request.xml_payload
  end

  test 'it should set all headers' do
    %w[
      X-EBAY-API-COMPATIBILITY-LEVEL X-EBAY-API-DEV-NAME
      X-EBAY-API-APP-NAME X-EBAY-API-CERT-NAME
      X-EBAY-API-CALL-NAME X-EBAY-API-SITEID
    ].each do |header|
      assert !@request.headers[header].blank?
    end
  end
end