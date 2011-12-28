module EbayTrading
  class Railtie < ::Rails::Railtie
    initializer 'ebay_trading.load_api_configuration' do |app|
      EbayTrading::Config.module_eval do
        class_variable_set '@@config', YAML.load_file("#{Rails.root}/config/ebay_trading.yml")[Rails.env]
      end
    end
  end
end