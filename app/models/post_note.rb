class PostNote < ApplicationRecord
  belongs_to :post
  belongs_to :my_note
end
