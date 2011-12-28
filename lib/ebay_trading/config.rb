module EbayTrading
  module Config
    class << self
      # this config class variable is overwritten if there is a ebay_trading
      # yml file in config folder (rails root)
      @@config = {
        'url'        => ENV['URL'],
        'app_name'   => ENV['APP_NAME'],
        'dev_name'   => ENV['DEV_NAME'],
        'auth_token' => ENV['AUTH_TOKEN'],
        'cert_name'  => ENV['CERT_NAME']
      }

      %w[dev_name app_name cert_name auth_token url].each do |method|
        define_method method do
          @@config[method]
        end
      end
    end
  end
end