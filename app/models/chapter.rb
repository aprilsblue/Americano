class Chapter < ApplicationRecord
  has_many :quotes
  belongs_to :user

  #Superchapter Associations
  has_many :superchapter_connections, foreign_key: :subchapter_id, class_name: "ChapterConnection"
  has_many :superchapters, through: :superchapter_connections, source: :superchapter

  #Subchapter Associations
  has_many :subchapter_connections, foreign_key: :superchapter_id, class_name: "ChapterConnection"
  has_many :subchapters, through: :subchapter_connections, source: :subchapter
end
