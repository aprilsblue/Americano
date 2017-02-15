class Like < ApplicationRecord
  #belongs_to :liker, class_name: "User", foreign_key: "user_id"
  belongs_to :user
  belongs_to :opinion
end
