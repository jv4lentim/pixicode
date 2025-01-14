class Album < ApplicationRecord
  belongs_to :user
  has_many :photos

  has_one_attached :banner
end
