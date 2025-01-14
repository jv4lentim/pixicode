class ChangePhotosTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :photos, :user_id, :integer
    add_column :photos, :sender_name, :string, null: true
  end
end
