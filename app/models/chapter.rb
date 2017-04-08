class Chapter < ApplicationRecord
  belongs_to :book
  has_many :exeercise
  has_many :question
end
