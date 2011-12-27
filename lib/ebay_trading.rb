module EbayTrading
  EBAY_SITES = {
    'Germany'     => :DE,
    'Italy'       => :IT,
    'US'          => :US,
    'France'      => :FR,
    'Spain'       => :ES,
    'Netherlands' => :NL,
    'Canada'      => :CA,
    'UK'          => :GB,
    'Australia'   => :AU,
    'Austria'     => :AT
  }

  EBAY_SITE_CODES = {
    :AT => 16,
    :US => 0,
    :FR => 71,
    :ES => 186,
    :GB => 3,
    :DE => 77,
    :NL => 146,
    :IT => 101,
    :AU => 15,
    :CA => 2
  }

  class EbayError < StandardError; end
  class RequestError < EbayError; end
  class TimeoutError < EbayError; end
end

require 'net/https'
require 'nokogiri'
require 'ebay_trading/config'
require 'ebay_trading/request'
require 'ebay_trading/response'
require 'ebay_trading/call_name'
require 'ebay_trading/money'
require 'ebay_trading/get_item'
require 'ebay_trading/railtie'