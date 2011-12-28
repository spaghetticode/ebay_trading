module EbayTrading
  module Config
    class << self
      # this config class variable is overwritten if there is a ebay_trading
      # yml file in config folder (rails root)
      @@config = {
        'url'        => ENV['EBAY_URL'],
        'app_name'   => ENV['EBAY_APP_NAME'],
        'dev_name'   => ENV['EBAY_DEV_NAME'],
        'auth_token' => ENV['EBAY_AUTH_TOKEN'],
        'cert_name'  => ENV['EBAY_CERT_NAME']
      }

      %w[dev_name app_name cert_name auth_token url].each do |method|
        define_method method do
          @@config[method]
        end
      end
    end
  end
end