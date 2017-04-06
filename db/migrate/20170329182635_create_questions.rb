class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|

      t.string     :title
      t.text       :content
      t.integer    :prize
      t.integer    :page
      t.references :chapter, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
