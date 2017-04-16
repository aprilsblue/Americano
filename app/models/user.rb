class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #User (who created the book instance) - Book relationship
  has_many :books
  has_many :posts
  has_many :replies
  has_many :likes
  has_many :like_posts, through: :likes, source: :post
  has_many :my_notes
end
