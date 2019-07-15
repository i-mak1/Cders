class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :payment
      t.integer :order_status
      t.integer :shipping_fee
      t.boolean :is_deleted
      t.integer :user_id

      t.timestamps
    end
  end
end
