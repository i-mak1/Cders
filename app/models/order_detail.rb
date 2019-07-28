class OrderDetail < ApplicationRecord
acts_as_paranoid without_default_scope: true

belongs_to :item, -> { with_deleted }
belongs_to :order, -> { with_deleted }

end
