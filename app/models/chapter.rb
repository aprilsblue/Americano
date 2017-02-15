class Chapter < ApplicationRecord
  has_many :quotes
  belongs_to :book
  belongs_to :user
end
