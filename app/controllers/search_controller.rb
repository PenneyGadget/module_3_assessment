class SearchController < ApplicationController
  def index
    bbs = BestBuyService.new
    @products = bbs.find_products(params[:product])
  end
end
