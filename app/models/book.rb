class Book < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :chapters
  has_many :questions
  has_many :notices

  #Reader(User) - Bookmark -Book relationship
end

