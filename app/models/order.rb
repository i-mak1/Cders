class Order < ApplicationRecord
acts_as_paranoid without_default_scope: true

belongs_to :enduser
belongs_to :shipping
has_many :order_details, dependent: :destroy

enum order_status: { 受付: 1, 商品準備中: 2, 出荷済: 3 }
enum payment: { 銀行振込で支払い: 1, クレジットカードで支払い: 2, 代引きで支払い: 3 }

validates :shipping_id, presence: true


end
