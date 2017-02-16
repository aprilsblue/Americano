class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #User (who created the book instance) - Book relationship
  has_many :books

  has_many :chapters
  has_many :opinions
  has_many :quotes

  #User - Like - Opinion relationship
  has_many :likes
  has_many :like_opinions, through: :likes, source: :opinion

  #Reader(User) - Bookmark -Book relationship
  has_many :bookmarks, foreign_key: :reader_id
  has_many :books, through: :bookmarks

end
