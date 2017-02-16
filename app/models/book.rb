class Book < ApplicationRecord
  belongs_to :user
  has_many :chapters

  #Reader(User) - Bookmark -Book relationship
  has_many :bookmarks
  has_many :readers, through: :bookmarks, source: :user
end

