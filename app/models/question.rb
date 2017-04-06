class Question < ApplicationRecord
  has_many :answers
  belongs_to :user
  belongs_to :book
  belongs_to :chapter
end
