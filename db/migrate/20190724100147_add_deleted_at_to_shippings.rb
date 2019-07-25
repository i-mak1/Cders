class AddDeletedAtToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :deleted_at, :datetime
    add_index :shippings, :deleted_at
  end
end
