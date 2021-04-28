class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]    

  def index
    @item = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
	def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :ship_cost_id, :prefecture_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

end
