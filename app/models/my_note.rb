class MyNote < ApplicationRecord
  # MyNote - UserNote - User
  has_many :user_notes
  has_many :users, through: :user_notes

  # MyNote - PostNote - Post
  has_many :post_notes
  has_many :posts, through: :post_notes
end
