class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    item.create(item_params)
  end

  private
	def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :ship_cost_id, :prefecture_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

end
