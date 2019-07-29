class Item < ApplicationRecord
acts_as_paranoid without_default_scope: true

has_many :carts, dependent: :destroy
has_many :disks, inverse_of: :item, dependent: :destroy
has_many :order_details, dependent: :destroy
has_many :songs, through: :disks
attachment :item_image

accepts_nested_attributes_for :disks, allow_destroy: true

enum item_status: { 販売中: 1, 販売停止中: 2 }

belongs_to :artist

belongs_to :genre

belongs_to :label

validates :price, presence: true, numericality: true
validates :stock_number, presence: true
validates :item_name, presence: true

	def self.search(search)
		if search
			where(['item_name LIKE ?', "%#{search}%"])
		else
			all
		end
	end
end
