class ChapterConnection < ApplicationRecord
  #Superchapter, SubChapter relationship
  belongs_to :superchapter, foreign_key: :superchapter_id, class_name: "Chapter"
  belongs_to :subchapter, foreign_key: :subchapter_id, class_name: "Chapter"
end
