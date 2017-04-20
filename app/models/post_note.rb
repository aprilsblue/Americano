class PostNote < ApplicationRecord
  belongs_to :post
  belongs_to :my_note

  def pick_post
    return Post.find(self.post_id)
  end
end
