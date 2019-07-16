class Song < ApplicationRecord

belongs_to :disk
has_many :item

end
