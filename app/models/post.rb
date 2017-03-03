class Post < ApplicationRecord
  belongs_to :book
  has_many :replies
  belongs_to :user
  has_many :likes
  has_many :like_users, through: :likes, source: :user

  #Post - PostsTags - Tags
  has_and_belongs_to_many :tags

  #callbacks
  after_create do
    post = Post.find_by(id: self.id)
    hashtags = self.content.scan(/#[a-zA-Z0-9가-힣]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      post.tags << tag
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.tags.clear
    hashtags = self.content.scan(/#[a-zA-Z0-9가-힣]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      post.tags << tag
    end
  end
end
