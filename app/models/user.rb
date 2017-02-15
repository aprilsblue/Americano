class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books
  has_many :chapters
  has_many :opinions
  has_many :quotes
  has_many :likes
  has_many :like_opinions, through: :likes, source: :opinion

end
