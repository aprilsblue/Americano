class MyNote < ApplicationRecord
  belongs_to :user

  # MyNote - PostNote - Post
  has_many :post_notes
  has_many :posts, through: :post_notes

end
