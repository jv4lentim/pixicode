class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.string :qr_code
      t.string :category
      t.datetime :start_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
