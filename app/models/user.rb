class User < ApplicationRecord
  # make basic box after creating user db
  after_create :basic_box

  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

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

  # return user's basic box
  def pick_basic_box
    if self.yeahapboxes.first.present?
      return self.yeahapboxes.first
    else
      return self.basic_box
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email || auth.provider+'@'+auth.uid
      user.password = Devise.friendly_token[0,20]

      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
