class MyNote < ApplicationRecord
  belongs_to :user

  # Mynote - pages
  has_many :in_notes
  has_many :yeahaps, through: :in_notes

end
