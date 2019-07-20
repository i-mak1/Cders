class Order < ApplicationRecord

belongs_to :enduser
has_many :order_details, dependent: :destroy

enum payment: { 銀行振込で支払い: 1, クレジットカードで支払い: 2, 代引きで支払い: 3 }

end
