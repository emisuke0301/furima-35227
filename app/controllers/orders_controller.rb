class OrdersController < ApplicationController
	before_action :set_item

	def index
		@order_buyer = OrderBuyer.new
	end

	def create
		@order_buyer = OrderBuyer.new(order_params)
		if @order_buyer.valid?
			@order_buyer.save
			redirect_to root_path
		else
			render :index
		end
	end

	private
	def order_params
		params.require(:order_buyer).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
	end

	def set_item
    @item = Item.find(params[:item_id])
  end
end
