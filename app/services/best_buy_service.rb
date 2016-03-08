class BestBuyService

  def initialize
    @connection = Faraday.new(:url => "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["apiKey"] = ENV["BEST_BUY_KEY"]
      faraday.params["format"] = "json"
    end
  end

  def find_product(product)
    connection.get do |request|
      request.url("/v1/products(longDescription=#{product}*)")
    end
  end

  private

  def parse
    JSON.parse(response.body, symbolize_names: true)
  end
end
