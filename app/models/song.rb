class Song < ApplicationRecord

belongs_to :disk
has_many :item

validates :song_name, presence: true

end
