class Exercise < ApplicationRecord
  has_many :solutions
  belongs_to :chapter
  belongs_to :book
  belongs_to :user
end
