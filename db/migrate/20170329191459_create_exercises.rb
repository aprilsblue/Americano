class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|

      t.integer    :number
      t.string     :content, default: "문제내용을 추가해주세요."
      t.integer    :prize, default: 0
      t.references :chapter, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
