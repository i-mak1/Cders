class Shipping < ApplicationRecord

belongs_to :enduser

has_many :orders

end
