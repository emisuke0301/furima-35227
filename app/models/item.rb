class Item < ApplicationRecord
	belongs_to :user
	has_one_attached :image

	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
	belongs_to :status
	belongs_to :ship_cost
	belongs_to :prefecture
	belongs_to :ship_date

	with_options presence: true do
		validates :name
		validates :text
		validates :price, numericality: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
		validates :image
	end
	with_options numericality: { other_than: 1 } do
		validates :category_id
		validates :status_id
		validates :ship_cost_id
		validates :prefecture_id
		validates :ship_date_id
	end
end
