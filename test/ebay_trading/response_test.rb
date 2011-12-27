require 'test_helper'

class EbayTrading::ResponseTest < ActiveSupport::TestCase
  def setup
    @call_name = EbayTrading::CallName.new
    @call_name.stubs(:custom_xml).returns('')
    @request = EbayTrading::Request.new(@call_name)
  end

  test 'it should raise an error' do
    EbayTrading::Response.any_instance.stubs(:http_post).returns(xml_from('get_item_invalid.xml'))
    assert_raise EbayTrading::RequestError do
      EbayTrading::Response.new(@request)
    end
  end

  test 'it should raise no error' do
    EbayTrading::Response.any_instance.stubs(:http_post).returns(xml_from('get_item.xml'))
    assert_nothing_raised do
      EbayTrading::Response.new(@request)
    end
  end
end