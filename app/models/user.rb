class User < ApplicationRecord
  # make basic box after creating user db
  after_create :basic_box

  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Yeahap & pages
  has_many :yeahaps
  has_many :pages, through: :yeahaps
  has_many :yeahapboxes

  # User - UserFriend - User
  has_many :user_friends, foreign_key: :followee_id
  has_many :followers, class_name: "User", through: :user_friends
  has_many :reverse_user_friends, class_name: "UserFriend", foreign_key: :follower_id
  has_many :followees, class_name: "User", through: :reverse_user_friends


  # create basic box
  def basic_box
    Yeahapbox.create(user_id: self.id, title: "basic box")
  end

  #return user's basic box
  def pick_basic_box
    if self.yeahapboxes.first.present?
      return self.yeahapboxes.first
    else
      return self.basic_box
    end
  end

end
