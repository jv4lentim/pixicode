class Photo < ApplicationRecord
  belongs_to :album

  has_one_attached :image
end

# == Schema Information
#
# Table name: photos
#
#  id          :bigint           not null, primary key
#  caption     :text
#  sender_name :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  album_id    :bigint           not null
#
# Indexes
#
#  index_photos_on_album_id  (album_id)
#
# Foreign Keys
#
#  fk_rails_...  (album_id => albums.id) ON DELETE => cascade
#
