class Shipping < ApplicationRecord
acts_as_paranoid without_default_scope: true

belongs_to :enduser

has_many :orders

end
