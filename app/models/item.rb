class Item < ApplicationRecord
	belongs_to :genre
	belongs_to :admin
	has_many :cart_item
	has_many :order_detail
	attachment :image
end
