class Book < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :chapters
  has_many :questions
  has_many :notices
  has_many :my_notes

  #Reader(User) - Bookmark -Book relationship
end

