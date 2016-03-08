class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name,
                                 :description,
                                 :image_url)
  end
end
