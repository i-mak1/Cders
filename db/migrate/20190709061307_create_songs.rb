class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.text :song_name
      t.integer :track
      t.integer :disk_id

      t.timestamps
    end
  end
end
