class Shipping < ApplicationRecord
acts_as_paranoid without_default_scope: true

belongs_to :enduser, -> { with_deleted }

has_many :orders

end
