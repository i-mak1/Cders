class OrderDetail < ApplicationRecord
acts_as_paranoid without_default_scope: true

belongs_to :item
belongs_to :order

end
