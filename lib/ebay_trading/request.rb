module EbayTrading
  class Request
    def initialize(call_name)
      @call_name = call_name
    end

    def headers
      {
        'X-EBAY-API-COMPATIBILITY-LEVEL' => '677',
        'X-EBAY-API-DEV-NAME'  =>  Config.dev_name,
        'X-EBAY-API-APP-NAME'  =>  Config.app_name,
        'X-EBAY-API-CERT-NAME' =>  Config.cert_name,
        'X-EBAY-API-CALL-NAME' =>  @call_name.to_s,
        'X-EBAY-API-SITEID'    =>  '0'
      }
    end

    def xml_payload
     %(<?xml version="1.0" encoding="utf-8"?>
       <#{@call_name} xmlns="urn:ebay:apis:eBLBaseComponents">
       <RequesterCredentials>
       <eBayAuthToken>#{Config.auth_token}</eBayAuthToken>
       </RequesterCredentials>
       #{@call_name.custom_xml}
       </#{@call_name}>
      )
    end
  end
end