json.extract! album, :id, :title, :description, :qr_code, :category, :start_date, :user_id, :created_at, :updated_at
json.url album_url(album, format: :json)
