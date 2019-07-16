class Disk < ApplicationRecord

belongs_to :item
has_many :songs, dependent: :destroy, inverse_of: :disk

accepts_nested_attributes_for :songs, allow_destroy: true
end
