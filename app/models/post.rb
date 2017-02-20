class Post < ApplicationRecord
  belongs_to :book
  has_many :replies
  belongs_to :user
end
