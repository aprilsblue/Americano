class PostPost < ApplicationRecord
  belongs_to :parent, class_name: :Post
  belongs_to :child, class_name: :Post
end
