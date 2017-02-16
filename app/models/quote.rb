class Quote < ApplicationRecord
  belongs_to :chapter
  belongs_to :user
  has_many :opinions

  #Quote - Bookmark 1:N relation
  has_many :bookmarks
end
