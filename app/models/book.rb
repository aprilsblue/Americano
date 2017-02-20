class Book < ApplicationRecord
  belongs_to :user
  has_many :post

  #Reader(User) - Bookmark -Book relationship
end

