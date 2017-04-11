class Chapter < ApplicationRecord
  belongs_to :book
  has_many :exercise
  has_many :question

  # unit 이 0이면 T
  def print_unit
    if self.unit.to_i == 0
      return "Notice"
    else
      return "Ch. " + self.unit.to_s
    end
  end
end
