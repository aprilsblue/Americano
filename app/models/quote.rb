class Quote < ApplicationRecord
  belongs_to :chapter
  belongs_to :user
  has_many :opinions
end
