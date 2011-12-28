module EbayTrading
  class Railtie < ::Rails::Railtie
    # if there is a config file present, use it instead of the env variables
    initializer 'ebay_trading.load_api_configuration' do |app|
      EbayTrading::Config.module_eval do
        config_file = Rails.root.join('config/ebay_trading.yml')
        class_variable_set('@@config', YAML.load_file(config_file)[Rails.env]) if File.file?(config_file)
      end
    end
  end
end