class AddCascadeDeleteToPhotosexit < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :photos, :albums
    add_foreign_key :photos, :albums, on_delete: :cascade
  end
end
