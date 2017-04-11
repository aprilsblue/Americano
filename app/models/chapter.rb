class Chapter < ApplicationRecord
  belongs_to :book
  has_many :exercise
  has_many :question
end
