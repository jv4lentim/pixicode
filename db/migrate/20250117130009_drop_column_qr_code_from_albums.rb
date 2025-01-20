class DropColumnQrCodeFromAlbums < ActiveRecord::Migration[8.0]
  def change
    remove_column :albums, :qr_code, :string
  end
end
