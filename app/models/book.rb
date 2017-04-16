class Book < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :my_notes

  self.per_page = 7
end

