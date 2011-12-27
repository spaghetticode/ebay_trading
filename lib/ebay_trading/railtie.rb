module EbayTrading
  class Railtie < ::Rails::Railtie
    config.before_configuration do
      EbayTrading::Config.module_eval do
        class_variable_set '@@config', YAML.load_file("#{Rails.root}/config/ebay_trading.yml")[Rails.env]
      end
    end
  end
end