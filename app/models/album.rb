class Album < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  has_one_attached :banner
  has_one_attached :qrcode

  validates :unique_id, uniqueness: true
end

# == Schema Information
#
# Table name: albums
#
#  id          :bigint           not null, primary key
#  category    :string
#  description :text
#  start_date  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  unique_id   :string           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_albums_on_unique_id  (unique_id) UNIQUE
#  index_albums_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
