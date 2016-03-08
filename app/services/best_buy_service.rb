class BestBuyService

  def initialize
    @connection = Faraday.new(:url => "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["apiKey"] = ENV["BEST_BUY_KEY"]
    end
  end

  private

  def parse
    JSON.parse(response.body, symbolize_names: true)
  end
end
