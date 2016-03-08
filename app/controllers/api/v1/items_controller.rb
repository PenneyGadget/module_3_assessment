class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_with status: 204
      # render json: {}, status: 204
  end

  private

  def item_params
    params.require(:item).permit(:name,
                                 :description,
                                 :image_url,
                                 :created_at,
                                 :updated_at)
  end
end
