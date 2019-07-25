class Shipping < ApplicationRecord
acts_as_paranoid

belongs_to :enduser

has_many :orders

end
