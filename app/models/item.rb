class Item < ApplicationRecord
	belongs_to :genre
	belongs_to :admin
	has_many :cart_item
	has_many :order_detail
	attachment :image
	enum is_active: {販売中: true, 売切れ: false}
end
