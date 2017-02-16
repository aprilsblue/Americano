class Bookmark < ApplicationRecord
  #Reader(User) - Bookmark -Book relationship
  belongs_to :reader, class_name: "User"
  belongs_to :book

  #Quote - Bookmark 1:N relationship
  belongs_to :quote
end
