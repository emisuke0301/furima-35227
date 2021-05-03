class OrderBuyer
	include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_num, :user_id, :item_id

	with_options presence: true do
		validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" }
		validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
		validates :city
		validates :block
		validates :phone_num, numericality: { only_integer: true, message: "Input only number" }, length: { in: 10..11 }
		validates :user_id
		validates :item_id
	end

	def save
		order = Order.create(item_id: item_id, user_id: user_id)
		Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_num: phone_num, order_id: order.id)
	end
end