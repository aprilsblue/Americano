class PostNote < ApplicationRecord
  belongs_to :post
  belongs_to :note
end
