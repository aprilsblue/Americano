class CreateSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :solutions do |t|

      t.text       :content
      t.references :user, index: true, foreign_key: true
      t.references :exercise, index: true, foreign_key: true

      t.timestamps
    end
  end
end
