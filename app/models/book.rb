class Book < ApplicationRecord
  belongs_to :user
  has_many :posts

  self.per_page = 7
end

