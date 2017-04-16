class Book < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :my_notes

  #Reader(User) - Bookmark -Book relationship
end

