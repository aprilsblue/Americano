class Page < ApplicationRecord
  has_many :yeahaps
  has_many :users, through: :yeahaps

  accepts_nested_attributes_for :yeahaps, allow_destroy: true
end
