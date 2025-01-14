class RenameEventFieldInPhotosToAlbum < ActiveRecord::Migration[8.0]
  def change
    rename_column :photos, :event_id, :album_id
  end
end
