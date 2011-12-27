module EbayTrading
  class CallName
    def initialize
      @request = Request.new(self)
    end

    def to_s
      self.class.name.split('::').last.chomp('Request')
    end

    def response
      @response ||= Response.new(@request)
    end

    def xml_response
      response.xml_response
    end
  end
end