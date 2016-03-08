class SearchController < ApplicationController
  def show
  end

  def create
    bbs = BestBuyService.new
    bbs.find_product(product)
  end

end
