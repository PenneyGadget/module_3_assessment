class SearchController < ApplicationController
  def index
  end

  def create
    bbs = BestBuyService.new
    bbs.find_product(params[:product])
    redirect_to search_path
  end

end
