class Opinion < ApplicationRecord
  belongs_to :quote
  belongs_to :user

  # User - Like - Opinion relationship
  has_many :likes
  has_many :likers, through: :likes, source: :user
end
