class MyNote < ApplicationRecord
  # MyNote - UserNote - User
  has_many :user_notes
  has_many :users, through: :user_notes

  # Mynote - pages
  has_many :in_notes
  has_many :yeahaps, through: :in_notes

end
