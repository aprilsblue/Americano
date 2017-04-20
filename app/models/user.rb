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

  # User - UserNote - MyNote
  has_many :user_notes
  has_many :my_notes, through: :user_notes

  # User - UserFriend - User
  has_many :user_friends, foreign_key: :followee_id
  has_many :followers, class_name: "User", through: :user_friends
  has_many :reverse_user_friends, class_name: "UserFriend", foreign_key: :follower_id
  has_many :followees, class_name: "User", through: :reverse_user_friends
end
