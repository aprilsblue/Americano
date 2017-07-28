class Yeahap < ApplicationRecord
  belongs_to :user
  belongs_to :page
  belongs_to :yeahapbox

  scope :public_true, -> { where(is_public: 1) }
  scope :public_false, -> { where(is_public: 0) }
end
