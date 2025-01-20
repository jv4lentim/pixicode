class AddUniqueIdToTableAlbums < ActiveRecord::Migration[8.0]
  def change
    add_column :albums, :unique_id, :string, null: false
    add_index :albums, :unique_id, unique: true
  end
end
