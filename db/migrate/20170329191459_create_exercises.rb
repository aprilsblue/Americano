class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|

      t.integer    :number
      t.string     :content
      t.integer    :prize
      t.references :chapter, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
