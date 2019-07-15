class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :price
      t.text :item_name
      t.text :item_image_id
      t.integer :stock_number
      t.integer :item_status
      t.boolean :is_deleted
      t.integer :artist_id
      t.integer :genre_id
      t.integer :label_id

      t.timestamps
    end
  end
end
