class RenameTableEventsToAlbums < ActiveRecord::Migration[8.0]
  def change
    rename_table :albums, :albums
  end
end
