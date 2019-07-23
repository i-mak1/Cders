class AddConfirmToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :confirm, :boolean, default: false
  end
end
