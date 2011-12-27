module EbayTrading
  class Response
    attr_reader :xml_response

    def initialize(request)
      @request = request
      @xml_response = Nokogiri.XML(http_post).remove_namespaces!
      check_for_errors
    end

    private

    def http_post
      uri = URI.parse(Config.url)
      req = Net::HTTP.new(uri.host, uri.port)
      req.use_ssl = true
      req.read_timeout = 10
      begin
        response = req.post(uri.request_uri, @request.xml_payload, @request.headers)
        raise RequestError, 'Problems retrieving data' unless response.is_a? Net::HTTPSuccess
      rescue Timeout::Error
        raise TimeoutError, 'Time out... remote server may be out of reach'
      end
      response.body
    end

    def check_for_errors
      if @xml_response.xpath('//Ack').text == 'Failure'
        message = @xml_response.xpath('//Errors/ShortMessage').text
        error_class = ('EbayTrading::' + @xml_response.xpath('//Errors/ErrorClassification').text).constantize
        raise error_class, message
      end
    end
  end
end