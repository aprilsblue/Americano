class Yeahapbox < ApplicationRecord
  belongs_to :user
  has_many :yeahaps
end
