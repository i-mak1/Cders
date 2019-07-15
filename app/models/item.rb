class Item < ApplicationRecord

attachment :image

has_many :carts, dependent: :destroy
has_many :disks, dependent: :destroy
has_many :order_details, dependent: :destroy

accepts_nested_attributes_for :disks


belongs_to :artist
belongs_to :genre
belongs_to :label

end
