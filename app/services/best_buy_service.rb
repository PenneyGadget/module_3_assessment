class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["apiKey"] = ENV["BEST_BUY_KEY"]
      faraday.params["format"] = "json"
    end
  end

  def find_products(product)
    parse(connection.get("/v1/products(longDescription=#{product}*)"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
