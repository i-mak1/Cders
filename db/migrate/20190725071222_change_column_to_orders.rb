class ChangeColumnToOrders < ActiveRecord::Migration[5.2]
  def up
  	change_column :orders, :order_status, :integer, default: 1
  end

  def down
  	change_column :orders, :order_status, :integer
  end
end
