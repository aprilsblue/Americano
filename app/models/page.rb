class Page < ApplicationRecord
  has_many :yeahps
  has_many :users, through: :yeahaps
end
