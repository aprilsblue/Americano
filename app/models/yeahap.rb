class Yeahap < ApplicationRecord
  belongs_to :user
  belongs_to :page
  has_many :in_notes
  has_many :my_notes, through: :in_notes
end
