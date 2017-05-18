class Yeahap < ApplicationRecord
  belongs_to :user
  belongs_to :page
  belongs_to :yeahapboxes
end
