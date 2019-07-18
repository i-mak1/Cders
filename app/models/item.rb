class Item < ApplicationRecord


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

end
