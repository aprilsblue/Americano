class UserNote < ApplicationRecord
  belongs_to :user
  belongs_to :my_note
end
