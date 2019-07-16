class Item < ApplicationRecord


has_many :carts, dependent: :destroy
has_many :disks, inverse_of: :item, dependent: :destroy
has_many :order_details, dependent: :destroy
attachment :item_image

accepts_nested_attributes_for :disks, allow_destroy: true

accepts_nested_attributes_for :disks


belongs_to :artist,optional: true

belongs_to :genre, optional: true

belongs_to :label, optional: true

end
