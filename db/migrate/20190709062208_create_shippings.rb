class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :shipping_first_name
      t.string :shipping_last_name
      t.string :shipping_first_name_kana
      t.string :shipping_last_name_kana
      t.string :shipping_postcode
      t.text :shipping_address
      t.boolean :is_delete
      t.integer :user_id

      t.timestamps
    end
  end
end
