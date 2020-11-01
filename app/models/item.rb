class Item < ApplicationRecord
	belongs_to :genre
	belongs_to :image
	has_many :cart_item
	has_many :order_detail
end
