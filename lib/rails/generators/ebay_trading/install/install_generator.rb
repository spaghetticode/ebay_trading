module EbayTrading
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Creates EbayTrading configuration file at config/ebay_trading.yml'

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def create_config_file
        template 'ebay_trading.yml', File.join('config', 'ebay_trading.yml')
      end
    end
  end
end
