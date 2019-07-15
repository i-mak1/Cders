class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
      t.text :disk_name
      t.integer :item_id

      t.timestamps
    end
  end
end
