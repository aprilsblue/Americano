class Chapter < ApplicationRecord
  has_many :quotes
  belongs_to :user
end
