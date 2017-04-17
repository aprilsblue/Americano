class Post < ApplicationRecord
  belongs_to :book
  has_many :replies
  belongs_to :user
  has_many :likes
  has_many :like_users, through: :likes, source: :user

  # Post - PostPost - Post
  has_many :post_posts, foreign_key: :child_id
  has_many :parents, through: :post_posts, class_name: :Post
  has_many :post_memos, class_name: :PostPost, foreign_key: :parent_id

  has_many :children, through: :post_memos, class_name: :Post

  # Post - PostNote - MyNote
  has_many :post_notes
  has_many :my_notes, through: :post_notes

  #Post - PostsTags - Tags
  has_and_belongs_to_many :tags

  #scope
  scope :is_parent, -> { where(is_child: false) }

  #callbacks
  after_create :tagging

  def tagging
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

  def title
    content = self.content
    if content.match(/<h4>[^<]*<\/h4>/).present?
      title = content.scan(/<h4>([^<>]*)<\/h4>/imu).flatten.select{|x| !x.empty?}[0]
    else
      title = content.scan(/<p>([^<>]*)<\/p>/imu).flatten.select{|x| !x.empty?}[0]
    end

    if title.nil?
      title = "There's no title"
    end

    return title
  end

  def like_sum
    result = 0
    self.likes.each do |x|
      result += x.evaluate
    end
    return result
  end
end
