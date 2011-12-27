module EbayTrading
  module Config
    class << self
      %w[dev_name app_name cert_name auth_token url].each do |method|
        define_method method do
          @@config[method]
        end
      end
    end
  end
end