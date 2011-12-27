module EbayTrading
  class Money
    attr_reader :currency_id, :amount

    def initialize(node=nil)
      # rescues added since rails 3.1 complains if node is not passed
      @currency_id = node['currencyID'] rescue nil
      @amount = node.text.to_f rescue 0.0
    end

    def to_s
      "#{currency_id} #{format('%0.2f', amount)}"
    end
  end
end