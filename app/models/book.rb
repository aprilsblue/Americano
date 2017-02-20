class Book < ApplicationRecord
  belongs_to :user
  has_many :posts

  #Reader(User) - Bookmark -Book relationship
end

