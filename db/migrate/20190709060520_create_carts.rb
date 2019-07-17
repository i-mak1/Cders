class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|

      t.timestamps
      t.integer :enduser_id
      t.integer :item_id
    end
  end
end
